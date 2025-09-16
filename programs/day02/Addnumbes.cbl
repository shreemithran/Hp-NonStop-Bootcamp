           IDENTIFICATION DIVISION.
           PROGRAM-ID. NUMSADD.
    
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 num1 PIC 9(3).
           01 num2 PIC 9(3).
           01 result  PIC 9(4).
    
           PROCEDURE DIVISION.
               *>  DISPLAY "ENTER A NUMBER:".
               ACCEPT num1.
               *> DISPLAY "ENTER ANOTHER NUMBER YOU WISH TO ADD:".
               ACCEPT num2.
               ADD num1 TO num2 GIVING result.
               DISPLAY "NUM1 + NUM2 IS:" result.
               STOP RUN.
  