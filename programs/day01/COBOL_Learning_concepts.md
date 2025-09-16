1. Structure of a COBOL Program

IDENTIFICATION DIVISION. → program metadata (mandatory).

ENVIRONMENT DIVISION. → system/environment setup (optional, not always used in basics).

DATA DIVISION. → variable definitions.

WORKING-STORAGE SECTION. → variables that live through the runtime.

LOCAL-STORAGE SECTION. → reinitialized variables per call.

PROCEDURE DIVISION. → the logic (DISPLAY, ACCEPT, ADD, etc.).

🔹 2. Data Types & Picture Clause

PIC 9(n) → numeric (digits only).

PIC X(n) → alphanumeric (letters, digits, symbols, spaces).

PIC A(n) → alphabetic only (letters + space).

PIC S9(n) → signed numbers (positive/negative).

PIC V → implied decimal point.

PIC P → scaling position (phantom zeroes).

🔹 3. Formatting / Editing Characters

Z → suppress leading zeros (turn into spaces).

$ → currency symbol.

, → comma insertion.

. → decimal point (displayed).

+ / - → display signs.

CR / DB → accounting notation.

🔹 4. Comments

In free-format COBOL → *> comment.

In fixed-format COBOL → * in column 7.

🔹 5. Important Rules

COBOL is not case sensitive.

Period (.) terminates statements/sections.

Indentation is not strict in free-format, but historically mattered in fixed-format (Area A/B).


7. Key Takeaways from Day 01

Learned the basic COBOL program flow.

Understood PIC usage for numbers, strings, and signed values.

Learned about scaling (P) and decimals (V).

Saw how formatting works (Z, $, commas).

Built first addition program (NUM1 + NUM2).