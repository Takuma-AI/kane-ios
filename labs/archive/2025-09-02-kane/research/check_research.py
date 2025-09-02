#!/usr/bin/env python3
import time
import json

research_tasks = [
    ("resp_68a6544343b88193bebb09e8c38db71a076a4faf1df97e6f", "01-competitive-analysis"),
    ("resp_68a654602cf48196b2c0fc677130cbb80d3886f40c750e21", "02-modern-apps-deep-dive"),
    ("resp_68a654cf5d908195b7a5092ecbe3a71900833d9a8346065f", "03-user-reviews-pain-points"),
    ("resp_68a654e33c0c8195b7b12897b45ea21b0039234806cd8c42", "04-ai-financial-advisors"),
    ("resp_68a654f877d881948114a8a9d84f9bfd089fc876c7a69c3d", "05-open-banking-technical"),
    ("resp_68a6550cc1148193a850adab7f87a8e10a315166fe925a70", "06-behavior-change-gamification"),
]

print("Research Task IDs saved for monitoring:")
for task_id, name in research_tasks:
    print(f"- {name}: {task_id}")

print("\nTo check a specific task, use:")
print("mcp__openai-deep-research__get_result with the task ID")