## COBOL Learning Path

### 1. **Program Structure**

Every COBOL program has **4 divisions**:

1. `IDENTIFICATION DIVISION.` → Metadata (program name).
2. `ENVIRONMENT DIVISION.` → (Optional) Defines input-output environment.
3. `DATA DIVISION.` → Variables, constants, file structures.
4. `PROCEDURE DIVISION.` → Business logic (the "code").

---

### 2. **Basic Syntax**

* COBOL is **not case-sensitive** (NUM1 = num1).
* Each statement ends with a **period (`.`)**.
* Uses **columns (historically)**:

  * Column 7 → `*` for comments.
  * Column 8–11 → Area A (DIVISIONS, SECTION headers).
  * Column 12–72 → Area B (actual code statements).
* Modern compilers (like GnuCOBOL) are flexible, but structure is good practice.

---

### 3. **Data Types**

COBOL has only **three core categories**:

* **Numeric** → `PIC 9(n)` (digits only).
* **Alphanumeric** → `PIC X(n)` (letters, digits, spaces).
* **Alphabetic** → `PIC A(n)` (letters only).

Modifiers:

* **S** → signed number (`PIC S9(4)` can hold +9999 or -9999).
* **V** → implied decimal (`PIC 9(3)V99` → 3 digits + 2 decimals).
* **Z/\$** → formatting masks (e.g., `$ZZ,ZZ9` → `$1,234`).

---

### 4. **Basic Verbs (Actions)**

* `DISPLAY` → Show output.
* `ACCEPT` → Take input.
* `MOVE` → Assign values.
* `ADD`, `SUBTRACT`, `MULTIPLY`, `DIVIDE` → Arithmetic.
* `IF`, `PERFORM` → Logic & loops.
* `STOP RUN` → End program.

---

### 5. **Data Layout**

* Variables are hierarchical (levels: 01, 05, 10, …).
* Example:

  ```cobol
  01 CUSTOMER.
     05 CUST-ID    PIC 9(5).
     05 CUST-NAME  PIC X(20).
  ```
* This allows structured data like records (similar to JSON/objects in modern languages).

---

### 6. **Conditional Statements**

* Syntax:

  ```cobol
  IF AMOUNT > 1000
     DISPLAY "HIGH VALUE TRANSACTION"
  ELSE
     DISPLAY "NORMAL TRANSACTION"
  END-IF.
  ```


