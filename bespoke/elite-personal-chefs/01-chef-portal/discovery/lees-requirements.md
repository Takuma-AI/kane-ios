EPC Payroll & Commission System – Feature & Scenario Requirements
Living document – last updated: 8/13/25

1. Overview
1.1 Purpose: This system will automate financial calculations for EPC’s chef contracts, including EPC commissions, chef payroll amounts, and handling of special contract structures such as team splits, grocery cost allocations, and gratuity distribution.
1.2 Scope: Must accommodate both meal prep delivery and private event contracts, with flexibility for varying scenarios and automatic updates based on Square invoice payment data.

2. Core Features
2.1 Contract & Customer Records – Store contract ID, client name, client email/phone, and Square Customer ID (if available).
2.2 Square Invoicing Sync (Real-Time or Near Real-Time) –
Listen for Square events (invoice created, updated, paid, refunded, voided).
Match invoices to EPC contracts by Square Invoice ID (preferred), Square Customer ID, or name+email (with manual review queue for mismatches).
Update contract status to Paid / Partially Paid / Refunded / Failed and trigger recalculation of chef pay.
2.3 Payment-Aware Chef Payment Calculation – Recalculate payable amounts only when an invoice is paid or proportionally if partially paid (per configuration).
2.4 Commission Calculation – 15% default, adjustable per contract.
2.5 Team Splits – Support even or custom splits between chefs.
2.6 Scenario Handling – Apply different calculation logic for meal prep vs private events.
2.7 Reporting – Weekly payroll summaries per chef with filters for Paid, Unpaid, Partially Paid.
2.8 Audit Trail – Record source Square event, timestamp, contract snapshot, and formulas used.
2.9 Reconciliation Tools – Manual match/override UI for unmatched or ambiguous invoices; maintain a change log.



3. Scenarios & Calculation Rules
3.0 Scenario #0 – Payment Trigger & Matching Rules
Description: Rules for when and how the system considers a contract payable based on Square invoice data.


Trigger Events:
Invoice status changes to Paid → Mark payable in current payroll cycle.
If partial payments are enabled, follow the configured handling mode.


Matching Order:
Square Invoice ID (exact match)
Square Customer ID (exact match)
Exact name + email match
Fuzzy name + email match (requires review)
Manual match queue for unresolved invoices


Partial Payment Handling:
All-or-Nothing: No payout until full payment received.
Pro-Rata Base: Pay base proportionally to amount received; grocery reimbursements and gratuity follow actual paid amounts.


Payroll Cutoff Window: Payments Mon–Sun are included in Monday payroll.


Special Considerations:
Refunds/chargebacks create negative adjustments on next payroll.
Tips added after initial payment are paid on next payroll.
Multi-invoice contracts supported (deposit + balance, etc.).



3.1 Scenario #1 – Solo Chef Meal Prep (Main Case)
Description: A single chef handles the full client contract for meal prep. They receive the contract base amount minus EPC commission. Grocery costs are fully reimbursed to the chef with no commission deducted. Any gratuity from the client goes entirely to the chef.


Formula / Steps:
 3.1.1 Take total contract base amount.
 3.1.2 Subtract 15% EPC commission.
 3.1.3 Add grocery reimbursement (full amount provided by chef).
 3.1.4 Add gratuity (full amount if applicable).


Example:
Contract base: $200
EPC commission (15%): $30
Grocery cost: $50
Gratuity: $25
Total pay: $200 - $30 + $50 + $25 = $245



3.2 Scenario #2 – Four-Chef Team Split with Individual Grocery Costs
Description: Team of four chefs works for the same client. Contract base amount is split evenly, gratuity split evenly, grocery costs vary per chef.


Formula / Steps:
 3.2.1 Take total contract base amount.
 3.2.2 Divide evenly by 4 (team members).
 3.2.3 Subtract 15% EPC commission from each chef’s share.
 3.2.4 Add individual grocery reimbursement for that chef.
 3.2.5 Add that chef’s share of gratuity (total gratuity ÷ 4).


Example:
Contract base: $200
Per chef base: $50
EPC commission (15%): $7.50
Grocery cost (Chef A): $25.00
Gratuity: $40 total → $10 per chef
Chef A total pay: $50 - $7.50 + $25 + $10 = $77.50



4. Variables & Data Inputs
4.1 EPC commission % (default 15%, adjustable)
4.2 Contract base amount
4.3 Service type (Meal Prep / Private Event)
4.4 Team size / chef IDs
4.5 Grocery cost per chef (optional, can be $0)
4.6 Gratuity amount (optional, default $0)
4.7 Contract date
4.8 Client name or ID
4.9 Square Customer ID
4.10 Square Invoice ID(s)
4.11 Payment status (Unpaid, Partially Paid, Paid, Refunded, Voided)
4.12 Partial payment handling mode (All-or-Nothing or Pro-Rata Base)
4.13 Payroll cutoff window
4.14 Gratuity source (Square tip field)
4.15 Name/Email matching tolerance (for fuzzy matches)

5. Edge Cases & Special Conditions
5.1 Partial payments — follow mode in 4.12.
5.2 Refunds / chargebacks — create negative adjustments in next payroll.
5.3 Duplicate invoices — flag and require manual resolution.
5.4 Name/email mismatches — send to manual review queue.
5.5 Multiple invoices per contract — support deposits, progress payments, final balances.
5.6 Gratuity timing — tips added after payment are included in next payroll.

6. Future Features / Nice-to-Haves
6.1 Deeper Square integrations — pull itemized invoice lines; push payout memos back to Square.
6.2 Square Payroll integration or CSV export for payroll runs.
6.3 Chef portal to view jobs, payouts, and audit history.
6.4 Alerts for payment received, partial payment, refund, or match review needed.

