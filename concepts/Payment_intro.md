
## 🔹 1. The Big Picture of a Card Transaction

When we swipe/dip/tap or use Apple Pay/Google Pay, we are triggering a **real-time financial message exchange** between **at least 6 parties**:

1. **Cardholder** → The person making the purchase.

   * Carries the card (or mobile wallet).
   * Has credentials: PAN (Primary Account Number), expiry date, CVV, PIN.

2. **Merchant** → The store or service provider.

   * Accepts your payment in exchange for goods/services.
   * Examples: grocery, gas station, hotel, e-commerce website.

3. **Acquirer / Acquirer Processor** → The merchant’s bank or its processor.

   * Example: Merchant is tied to **Bank of America Merchant Services**.
   * Acquirer receives the request first and ensures it gets routed correctly.

4. **Network / Scheme** → Visa, MasterCard, Amex, Discover, RuPay.

   * Acts like a “traffic police.”
   * Ensures the request goes to the **correct issuer bank**.

5. **Issuer / Issuer Processor** → The bank that issued the card.

   * Example: Citibank issued your credit card.
   * Final authority: checks if transaction can be approved.

6. **Gateway** (optional layer, especially in e-commerce).

   * Example: Stripe, PayPal, Razorpay.
   * Collects merchant requests and forwards them to acquirers.

---

## 🔹 2. The Transaction Flow (Step by Step)

1. Cardholder initiates payment.
2. POS/e-commerce **encodes request in ISO 8583 format**.
3. Request goes → **Acquirer Processor**.
4. Acquirer sends to **Network (Visa/Master)**.
5. Network routes to **Issuer Bank**.
6. Issuer checks:

   * Valid card number?
   * Enough balance/credit limit?
   * Card not blocked/fraud-flagged?
7. Issuer sends back **response code** (Approved/Declined/Other).
8. Merchant receives response → delivers goods/services.
9. Later, settlement moves the actual money between banks.

 All of this happens in **\~2 seconds SLA**, even at thousands of TPS.

---

## 🔹 3. ISO 8583 – The Universal Language

Think of ISO 8583 as the **HTTP of payments**. Every transaction is a message with a defined structure:

* **MTI (Message Type Identifier)** → tells what kind of message it is.

  * `0100` → Authorization request.
  * `0110` → Authorization response.
  * `0200` → Financial transaction request (completion).
  * `0210` → Response to financial transaction.

* **Data Elements (DEs)** → 128 or 192 fields depending on version.

  * DE2 = Primary Account Number (PAN).
  * DE3 = Processing code (purchase, withdrawal, etc.).
  * DE4 = Transaction amount.
  * DE7 = Transmission date & time.
  * DE11 = System trace audit number (STAN).
  * DE32 = Acquiring institution ID.
  * DE37 = Retrieval reference number (RRN).
  * DE39 = Response code (00 = Approved, 05 = Decline, etc.).
  * DE41 = Terminal ID.
  * DE49 = Currency code.
  * … up to \~800 attributes logged in real life.

 That’s why in fraud analytics you can detect unusual IP, location mismatch, repeated use, etc.

---

## 🔹 4. Authorization vs Completion

* **Authorization** → Temporary hold.

  * Gas station locks \$50 before you pump gas.
  * Hotel locks \$500 deposit when you check-in.

* **Completion** → Final amount.

  * After you pump \$33 worth gas → completion is \$33.
  * After hotel checkout → actual bill adjusted.

* **Cancellation** → Authorization reversed, funds released.

* **Adjustment** → Completion greater than authorization (e.g., restaurant tips).

---

## 🔹 5. Settlement & Clearing

* Merchants don’t get money instantly.
* Example: \$100 purchase → merchant might only get \$95.

  * Fees distributed among: Acquirer, Issuer, Network.
* Actual money transfer happens in **batch settlement** (T+2 days).
* Why delay? → Rollbacks, chargebacks, fraud checks, reconciliation.

---

## 🔹 6. Key Terminologies

* **BIN/IIN (Bank Identification Number / Issuer Identification Number)**

  * First 6–8 digits of PAN.
  * Used for routing → identify issuing bank and card scheme.
  * Example: `431580` → Visa + Citibank.

* **PAN (Primary Account Number)**

  * Full card number (typically 16 digits, can be 19 for some products).
  * Contains BIN + account identifier + check digit.

* **Asynchronous vs Synchronous**

  * **Async**: Initial request doesn’t wait for final outcome (gas station pre-auth).
  * **Sync**: Waits for completion before closing transaction (ATM cash withdrawal).

* **Idempotency**

  * Ensures the **same transaction is not processed twice**.
  * Completion carries primary transaction’s ID to “link” them.

* **Response Codes** (from issuer)

  * `00` → Approved.
  * `05` → Do not honor.
  * `12` → Invalid transaction.
  * `14` → Invalid card number.
  * `51` → Insufficient funds.
  * `91` → Issuer unavailable.

* **Chargeback**

  * Customer disputes a transaction → funds pulled back from merchant.

---

## 🔹 7. Performance & SLA

* **Transactions per second (TPS)**:

  * Normal: \~3,000 TPS.
  * Peak (holiday season): \~6,000 TPS or more.
* SLA: **≤ 2 seconds** end-to-end.
* Any downtime = huge financial + reputation loss.

---

## 🔹 8. HP NonStop in Payments

Why HP NonStop is critical:

* **Fault tolerant**: Designed for “no single point of failure.”
* **Linearly scalable**: Can just add nodes → capacity doubles.
* **COBOL + TAL + SQL** are common languages used.
* Runs acquirer processors & high-volume transaction switches.

It’s basically the **engine room** of global payment systems. Visa, Mastercard, and many big banks use HP NonStop in their backend.



## 🔹 9. Fraud Detection (Modern Layer)

* Systems capture **hundreds of attributes (\~800)** per transaction:

  * Card number, merchant, device ID, cashier ID.
  * Location, IP address, country, currency.
  * Velocity (how many txns in short time).
  * Cross-location anomalies (Florida vs California in 2 min).
* AI/ML fraud engines flag & sometimes request **step-up authentication** (OTP, 3D Secure).


## 🔹 10. Analogies to Remember

* Payment Network = **Highway**.
* Acquirer = **Toll gate for merchants**.
* Issuer = **Your home bank** (final approval).
* ISO 8583 = **Common language like English/HTTP**.
* HP NonStop = **Aircraft engine – must never stop**.




