# Memory Orbs – Phase 2: AI‑First Memories (Rails, simple, production‑ready)

## Philosophy
- Memories are the product. Never show raw transactions.
- Nothing renders until AI has formed a Memory.
- Keep request cycle clean; all heavy lifting in background jobs.
- Favor simple, boring Rails: Active Job, models, controllers, views. Add Turbo Streams later if needed.
- UI terminology: refer to entries as “spending” (not “transactions,” and we don’t surface the internal term “memory”).

## Scope (Phase 2)
- Convert app to be Memory‑first.
- Move sorting to `Memory` (not `Transaction`).
- On first connect or on-demand refresh: enqueue sync + memory formation jobs only; render a transparent loading state until a threshold of AI‑formed memories exists.
- No baseline descriptions; AI must succeed for any Memory to exist.
- Defer regeneration/enhancement flows to Phase 3.

## Data Model
- `memories` (primary UI entity)
  - Add: `pile: integer` (enum: `need`, `want`, `kill`)
  - Add: `sorted_at: datetime`
  - Unique index: `index_memories_on_transaction_id_unique` on `transaction_id` to ensure one current memory per transaction

### Migrations
- Migration A: add fields to `memories` (`pile`, `sorted_at`) and unique index on `transaction_id`.

## Background Pipeline (never in controllers)
- First‑time setup (on connect): `SyncTransactionsForAccountJob` (one‑time trigger)
  - Uses `PlaidSyncService` for the newly connected account.
  - For each added transaction: enqueue a `FormMemoryJob` for that transaction.
  - Modified/removed handled by the service; modified can enqueue a `FormMemoryJob` again (idempotent), removed ignored.
- Ongoing (recurring schedule): a periodic job runs in the background to perform the same sync + enqueue `FormMemoryJob` work. Users never trigger this manually.
- Memory formation: `FormMemoryJob` (per‑transaction)
  - Guardrails: skip if a `Memory` already exists (unique index is the final guard).
  - Run `MemoryFormationService.new(transaction).create_memory` which performs AI. On success, persist `Memory`. On failure, let the job retry and then fail silently without creating a placeholder.
  - Retries: low retry count with exponential backoff. Idempotent via unique index.

Notes:
- Do not add fallback/baseline in Phase 2.
- Do not implement regeneration/enhancement in Phase 2.

## Controllers & Routes
- Root: `memories#index` (list of spending entries).
- `MemoriesController#index`
  - If `Memory.unsorted.recent_first.limit(N)` exists for the session’s account, render the list.
  - Else, redirect to onboarding loading (`loading#onboarding`) with copy like: “We’re setting up your account. Come back in 10–15 minutes.”
- Refresh behavior (everyday use)
  - The Refresh button does NOT trigger Plaid sync or memory creation.
  - It only rechecks whether new Memories are available and updates the list if so.
  - Implement as either:
    - A GET to `memories#index` (simple full reload), or
    - An AJAX/Turbo Frame call to a lightweight `MemoriesController#status` that responds with `{ ready: true/false, count: <int> }`, and then the client refreshes the list when `ready`.
- Status endpoint (for polling)
  - Route: `get "/memories/status" => "memories#status"` returning JSON for the current account: `{ ready: boolean, count: integer }`.
- Onboarding loading screen
  - Route: `get "/onboarding" => "loading#onboarding"` (or `loading#index` if you prefer), used only right after connect.

## Auto‑show when ready (Rails‑simple approach)
- Use lightweight polling on the onboarding screen every 2–3 seconds calling `/memories/status`.
- When `ready` is true (e.g., at least `threshold` Memories exist), auto‑redirect to `/memories`.
- Keep it boring: no websockets required in Phase 2. Turbo Streams can be added later to push updates.

## Views
- `memories/index.html.erb`
  - Render only `Memory` rows (as “spending”).
  - Show `description`, `amount`, `semantic_date`.
  - Sorting controls act on `Memory`.
- `loading/onboarding.html.erb`
  - Honest copy about first‑time setup (10–15 minutes typical).
  - Include a small script that polls `/memories/status` and redirects to `/memories` when ready.
- Refresh UX (everyday)
  - The list page can include a “Check for new spending” button that either reloads the page or hits `/memories/status` and, if `ready`, refreshes the list.

## Progress (optional)
- Memory‑only: show “X spending entries ready” based on `Memory` count for the account.
- Avoid exposing transaction counts; the transaction layer is not user‑visible.

## Concurrency & Reliability
- One job per transaction (`FormMemoryJob`).
- Queue: `:memories` with low parallelism (3–5 workers) to respect OpenAI limits.
- Idempotency: unique index on `memories.transaction_id` and pre‑checks in the job.
- Backoff: default Active Job exponential backoff with max 3 retries; on final failure, no `Memory` is created.
- Plaid errors handled in `PlaidSyncService` (already present) and job exceptions logged; nothing in controllers.

## Instrumentation & Ops
- Log counters for formed, failed, retried.
- Add a daily metric: number of new `memories` per account.
- Expose `/up` (already) and add a lightweight “pipeline status” log line in `SyncTransactionsForAccountJob`.

## Testing
- Model: `Memory` validations and moving sorting to `Memory`.
- Job: `FormMemoryJob` idempotency and failure marking.
- Service: stub OpenAI in `MemoryFormationService` and assert `Memory` creation on success and failure behavior (no Memory, transaction marked failed).
- Controller: `MemoriesController#index` redirects to loading when none exist; shows list when they do.

## Rollout Plan
1. Add migrations and model updates (move sorting to `Memory`; unique index on `memories.transaction_id`).
2. Switch root to `memories#index`; add `loading#onboarding` route and view.
3. Add `/memories/status` endpoint returning `{ ready, count }` for polling.
4. Implement one‑time sync trigger after connect; keep recurring job for ongoing sync/formation.
5. Make Refresh a check‑only action (no sync), either full reload or status‑then‑reload.
6. Ship; optionally add Turbo Streams later for live updates without polling.

## Open Questions
- Threshold for “ready” (10 or 15 memories) before first entry to `memories#index`?
- Do we add email notification for readiness now or later?

## Summary
- Memory‑only UI, AI‑first formation, no baselines.
- Sorting moves to `Memory`.
- Background‑only pipeline with honest loading screen.
- Simple, Rails‑native, production‑ready, and extensible for Phase 3 context enrichment. 