1. Failures & Recovery
HP NonStop is designed to expect failures.

Common failures:
Hardware crash (CPU or disk stops working).
Memory exhaustion (RAM is full/corrupted).
Deadlocks: process A locks file X, process B locks file Y, both wait on each other → system detects and resolves.

I/O failures: hard disk cannot read/write, or CPU ↔ network connection fails.
How HP NonStop responds:
Automatic failover to backup.
Rollback/replay using TMF.
If a whole data center fails → Disaster Recovery (DR): a backup data center (replicated live data) takes over.

2. High Availability Concepts
High Availability (HA) = System designed to minimize downtime.
Five Nines (99.999%) = Only ~5 minutes downtime in a year.
Redundancy = Every component (CPU, memory, I/O bus) exists in pairs.
Disaster Recovery (DR) = If one entire data center fails (e.g., flood, fire), another takes over.

3. Key Banking Domain Concepts (from earlier sessions, connected here)
Authorization vs Completion
Authorization = “lock” money (e.g., $50 at a gas pump).
Completion = “actual” debit (e.g., $33 when filling finishes).

Settlement
End-of-day batch where merchant sends all completed transactions to acquirer bank.
Acquirer → network → issuer → ACH clearing house → funds released to merchant (T+2).

Interchange
The actual money flow between issuing bank and acquiring bank.
Networks like Visa/Mastercard ensure interchange fees are taken (e.g., $100 sale, merchant gets $97, fees deducted).

Flashcards (Revision)

Q1. What is Shared Nothing Architecture?
A1. Every CPU has its own independent memory & disk; avoids bottlenecks and increases fault tolerance.

Q2. What is Checkpointing?
A2. Saving the state of a process so backup can resume from the last save, not from zero.

Q3. What is TMF?
A3. Transaction Management Facility → ensures ACID transactions, preventing partial updates.

Q4. How does HP NonStop achieve 99.999% availability?
A4. Through redundancy, process pairs, checkpointing, and failover mechanisms.

Q5. What’s the difference between Settlement and Interchange?
A5. Interchange = money flow between issuer/acquirer banks.
Settlement = merchant actually receives funds (after T+2).

Q6. Example of a failure NonStop can recover from?
A6. CPU crash, deadlock, memory exhaustion, I/O failure.