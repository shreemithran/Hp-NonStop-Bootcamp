

# HP NonStop Concepts

## 1. Limitations of Traditional Unix/Linux

* **Single Points of Failure** → One CPU, one memory; if kernel crashes, the whole system goes down.
* **Weak Process Management** → No process pairs, no automatic failover, crashes need manual intervention.
* **Shared Memory Risks** → One bad process can corrupt memory shared with others.

---

## 2. HP NonStop – Core Principles

* **No Single Point of Failure** → Every component (CPU, disk, memory, I/O) has redundancy.
* **Automatic Detection & Failover** → Failures handled in milliseconds.
* **Linear Scalability** → Adding more CPUs/I/O modules increases throughput almost linearly.
* **Shared-Nothing Architecture** → Each processor works independently, reducing bottlenecks.

---

## 3. Industry Use Cases

* **Banking & Finance** → ATM networks, real-time settlements, stock exchange trading.
* **Telecom** → Call processing, billing, SMS/message routing.
* **Retail & Payments** → Point of Sale (POS) transaction processing, Visa/MasterCard switching, real-time fraud detection.

---

## 4. Process Pairs

* **Primary Process** → Actively handles client requests.
* **Backup Process** → Runs on a different CPU, stays in sync via **checkpointing**.
* **Checkpointing** → Saves intermediate state so backup can take over seamlessly.
* **Failover Steps**:

  1. **Detection** → Primary failure detected in ms.
  2. **Promotion** → Backup becomes new primary.
  3. **Recovery** → A new backup is spawned.
* **Benefit**: Preserves in-flight transactions and achieves *99.9999% uptime*.

---

## 5. Transaction Management Facility (TMF)

* Ensures **ACID compliance**.
* **Steps**:

  1. Begin transaction → Assigns unique transaction ID.
  2. Redundant logging → Changes logged on mirrored disks.
  3. Two-Phase Commit (2PC) → Prepare + Commit phases across all resources.
  4. Rollback → If any participant fails, undo changes safely.

---

## 6. Retail Transaction Flow (ISO 8583-based)

* **Point of Sale (POS)** → Customer swipes/dips/taps card. Builds an **ISO 8583 Authorization Request (0100)** with details (PAN, amount, merchant ID, STAN).
* **Switch** → Merchant’s gateway/processor. Routes request to Acquirer.
* **Acquirer Processor (Merchant’s Bank)** → Validates merchant & forwards ISO 8583 request.
* **Network/Scheme** (VisaNet, MasterCard Banknet, NPCI, etc.) → Validates, applies fraud rules, routes by **BIN (Bank Identification Number)**.
* **Issuer Processor (Cardholder’s Bank)** → Checks card validity, balance/credit limit, fraud rules. Sends **ISO 8583 Response (0110)** with approval/decline code.
* **Core Banking System** → Updates balance & ledger in real-time.

