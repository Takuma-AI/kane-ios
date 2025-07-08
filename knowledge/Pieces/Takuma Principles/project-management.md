# Taskcraft Guide

*Forge steadily, cut cleanly, leave no rough edge.*

---

## 1. Purpose

We turn raw chatter into finished craft. Every conversation, note, or spark of an idea should end as a **named, archivable output**—a Basecamp to‑do list whose title declares the deliverable as already done. When the deliverable ships, the list closes, the team moves on, and history stays searchable.

> **North‑Star Question**
> *“If this work were magically complete, what tangible thing would exist?”*
> **Alternate phrasing:** *“What will be true when this progress is made?”*
> The answer is your output‑list title.

---

## 2. Output‑First Operating Model

Outputs are the atomic currency of progress. This model rests on five invariants:

1. **Everything ships through a list.** Nothing lives only in chat or a doc. If it matters, it earns a list.
2. **The list name equals the deliverable.** Written in past or perfect tense—*“Customer Onboarding Flow Localized,”* not *“Localization Tasks.”*
3. **Archival on completion.** As soon as the deliverable exists, the list archives to *Done*. Celebration replaces maintenance.
4. **Progress is visible.** Anyone can count shipped outputs, not guess at busywork.
5. **Completeness enforced.** If you’re doing work that isn’t captured by an output‑named list, the process is broken—stop and make the list.

This reframes project management from “tasks to check” into “artifacts to produce.” Scope, resourcing, and tooling flow outward from the desired artifact instead of inward from individual functions.

### 2.1 Litmus Test

At any moment, a teammate should be able to open the index of active output lists and answer three questions with zero extra context:

1. **What work is underway across the company?**
2. **Who owns each deliverable and when is it due?**
3. **What doors have already been walked through (milestones) and what doors remain?**

If the answer to *any* of these questions requires searching Slack or tapping someone on the shoulder, create or update the missing list. The system is only as strong as its completeness.

---

## 3. Anatomy of an Output List

An output list holds exactly three structural layers:

| Layer           | Purpose                  | Naming Rule                                                                                                                                               |
| --------------- | ------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **List Title**  | Concrete deliverable     | Past/perfect tense (*“V2.1 Hotfix Deployed”*). A quick heuristic: ask, *“What will be true when this progress is made?”* Use that statement as the title. |
| **Todo Groups** | Irreversible checkpoints | Past/perfect tense (*“Smoke Tests Passed”*)                                                                                                               |
| **Tasks**       | Atomic actions           | Present tense Verb + Object (*“Tag commit v2.1.3”*)                                                                                                       |

### 3.1 Todo Groups as Milestones

A group is a doorway—you walk through once, never back. Examples: *“QA Sign‑offs,” “Stakeholder Approval Sent.”* A good group title ends debate about whether it’s done.

### 3.2 Task Craft

| Field         | Guideline                                   |
| ------------- | ------------------------------------------- |
| **Title**     | *Verb + Object* (*“Draft release notes”*)   |
| **Why**       | One sentence linking the task to the output |
| **Done When** | Bulletproof criteria a stranger can assess  |
| **Due**       | ISO‑8601 date; no fuzzy words               |
| **Notes**     | Links, assets, references—never duplicated  |

> **Done When Template**
> • Acceptance bullets satisfied
> • Code merged & tests green
> • Docs updated at `<link>`

---

## 4. From Raw Noise to Archived Output

1. **Listen** – Ingest chat, voice, docs.
2. **Detect Output** – Spot deliverable phrases; create list.
3. **Slice Milestones** – Extract temporal or structural gates; create groups.
4. **Forge Tasks** – Write tasks using Task Craft standards.
5. **Enrich** – Pull links, files, @mentions into Notes & Assignee.
6. **Schedule** – Infer or request Due dates.
7. **Archive** – When all groups hit *Done*, close list automatically and log to history.

No one invents missing data; clarification is requested. Precision beats assumption.

---

## 5. Operating Rhythm

| Cadence             | Ritual                                                  | Owner       |
| ------------------- | ------------------------------------------------------- | ----------- |
| **Daily – 17:00**   | *Stand‑back Digest* – new tasks, due‑tomorrow, blockers | Automation  |
| **Weekly – Monday** | *Refresh* – slip review, rescope or cut                 | Team leads  |
| **Cycle – 6 weeks** | *Hill‑Chart Review* + Retro; archive shipped lists      | Entire team |

---

## 6. Quality Bar

1. **Clarity over brevity** – Extra sentence beats extra meeting.
2. **Single source** – One canonical link per asset.
3. **Zero scavenger hunts** – All context within the task or one click away.
4. **Fast edge** – Creating or importing a list takes < 60 s.

---

## 7. Lifecycle of a List

1. **Birth** – Detected or manually created from a conversation.
2. **Active** – Tasks flow, Hill Chart moves left→right.
3. **Guard‑Rail Check** – If overdue and unmoving, trigger a *scope hammer* or *kill switch*.
4. **Archive** – Output verified, list closed, retro added to Docs & Files.
5. **Metric Follow‑Up** – Outcomes monitored; insights feed the next shaping cycle.

---

## 8. Implementation Tips

* **Small first slice** – Pilot with one team for a six‑week cycle.
* **Rename ruthlessly** – If the deliverable changes, change the list title.
* **Automate the closure** – Use a webhook or rule: when the last task completes, archive automatically.

---

This framework embeds Shape Up’s fixed‑time, variable‑scope spine into everyday execution. Outputs define reality; tasks reveal the path; archiving locks the progress into company memory. Keep forging, keep archiving, and the company moves forward one finished artifact at a time.
