# Phase 3 – Gmail Context Backend: Integration Guide (for UI engineers)

This document explains how to use the backend primitives already implemented on the `feature/memory-orbs-phase-3` branch. It focuses on how the UI should trigger OAuth, show status, and optionally start background syncs. No UI has been shipped – this is the contract.

## What’s implemented

- Data model:
  - `purchase_contexts` stores parsed receipt info, including `items` (JSON), `description`, `email_context`, `merchant`, `amount`, `purchase_date`, and `gmail_message_id` (idempotency). Belongs to `user`.
  - `memories.purchase_context_id` optionally links a Memory to a `PurchaseContext` that enriched its prompt.
- Gmail OAuth endpoints:
  - `GET /google/connect` → redirects to Google OAuth (gmail.readonly) with offline access
  - `GET /google/callback` → stores tokens on the current `User`. ENV required: `GOOGLE_CLIENT_ID`, `GOOGLE_CLIENT_SECRET`, `GOOGLE_REDIRECT_URI` (e.g. `http://localhost:3000/google/callback`).
- Background pipeline:
  - `GmailSyncService#sync_receipts` polls Gmail for last 2 days of likely receipts and calls the LLM parser. Idempotent via `gmail_message_id`.
  - Jobs:
    - `SyncGmailForUserJob.perform_later(user_id)` – one-off sync for a user
    - `SyncGmailJob` – recurring job enqueued via `config/recurring.yml` (every 15 minutes in dev). Uses Solid Queue.
  - Memory formation (`MemoryFormationService`) automatically looks up the current user’s last-24h `PurchaseContext` and includes `items`/`description`/`email_context` in the AI prompt when present. It still creates memories AI-first if no context exists.

## UI contract

### 1) Connect Gmail
- Present a button that navigates to `GET /google/connect`.
- After the consent flow returns to `/google/callback`, the tokens are saved and the user should be considered “Gmail connected”.

### 2) Trigger a sync (optional)
- You can enqueue a one-off sync for the current user by calling `SyncGmailForUserJob.perform_later(current_user.id)` from a controller action or background hook.
- Alternatively, rely on the `SyncGmailJob` recurring schedule (dev: every 15m; prod can be tuned).

### 3) Onboarding/progress
- The existing onboarding progress for memories remains unchanged. It measures “memories formed for transactions in the last 14 days”. Gmail context is additive: if contexts exist, new memories will incorporate them; otherwise memories are formed without context.

## ENV / setup
- `.env` must include:
  - `GOOGLE_CLIENT_ID`
  - `GOOGLE_CLIENT_SECRET`
  - `GOOGLE_REDIRECT_URI` (local: `http://localhost:3000/google/callback`)
  - `OPENAI_API_KEY` (used by the parser and memory formation)
- Google Cloud Console:
  - Enable Gmail API
  - OAuth consent screen: External (Testing), add tester accounts
  - Web client: add the redirect URI and JS origin

## Dev testing flow
1) Start app and worker: `./bin/dev`
2) Connect a bank (Phase 2 pipeline forms memories)
3) Connect Gmail via `/google/connect`
4) (Optional) Hit `/sync_gmail` to enqueue a manual Gmail sync
5) Check logs: `Gmail sync for user X: created N contexts`
6) New memories formed after contexts will include enriched prompt fields and can link to a `PurchaseContext`.

## Notes / limitations
- Polling only; Pub/Sub push/webhook is out-of-scope for Phase 3.
- Parser is LLM-first; one email → one purchase; duplicates acceptable.
- SQLite dev uses `json` column; Postgres prod maps to `jsonb` automatically.


