       IDENTIFICATION DIVISION.
       PROGRAM-ID. pizza.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       01 WS-MSG.
           05 WS-LETTER-1     PIC X    VALUE "S".
           05 WS-LETTER-2     PIC X    VALUE "a".
           05 WS-LETTER-3     PIC X    VALUE "i".
           05 WS-LETTER-4     PIC X    VALUE "s".
           05 WS-LETTER-5     PIC X    VALUE "i".
           05 WS-LETTER-6     PIC X    VALUE "r".
           05 WS-LETTER-7     PIC X    VALUE " ".
           05 WS-LETTER-8     PIC X    VALUE "l".
           05 WS-LETTER-9     PIC X    VALUE "e".
           05 WS-LETTER-10     PIC X    VALUE " ".
           05 WS-LETTER-11     PIC X    VALUE "n".
           05 WS-LETTER-12     PIC X    VALUE "o".
           05 WS-LETTER-13     PIC X    VALUE "m".
           05 WS-LETTER-14     PIC X    VALUE "b".
           05 WS-LETTER-15     PIC X    VALUE "r".
           05 WS-LETTER-16     PIC X    VALUE "e".
           05 WS-LETTER-17     PIC X    VALUE " ".
           05 WS-LETTER-18     PIC X    VALUE "d".
           05 WS-LETTER-19     PIC X    VALUE "e".
           05 WS-LETTER-20     PIC X    VALUE " ".
           05 WS-LETTER-21     PIC X    VALUE "c".
           05 WS-LETTER-22     PIC X    VALUE "o".
           05 WS-LETTER-23     PIC X    VALUE "n".
           05 WS-LETTER-24     PIC X    VALUE "v".
           05 WS-LETTER-25     PIC X    VALUE "i".
           05 WS-LETTER-26     PIC X    VALUE "v".
           05 WS-LETTER-27     PIC X    VALUE "e".
           05 WS-LETTER-28     PIC X    VALUE "s".

       01 WS-TAB-INGREDIENTS.
           05 FILLER              PIC X(9)     VALUE "Farine : ".
           05 WS-FARINE-RESULT    PIC Z(5)9.999.
           05 FILLER              PIC XXX       VALUE " kg".
           05 FILLER              PIC X        VALUE SPACES.
           05 FILLER              PIC X(9)     VALUE "Levure : ".
           05 WS-LEVURE-RESULT    PIC Z(3)9.999.
           05 FILLER              PIC XXX       VALUE " kg".
           05 FILLER              PIC X        VALUE SPACES.
           05 FILLER              PIC X(9)     VALUE "Beurre : ".
           05 WS-BEURRE-RESULT    PIC Z(3)9.999.
           05 FILLER              PIC XXX       VALUE " kg".
           05 FILLER              PIC X        VALUE SPACES.
           05 FILLER              PIC X(9)     VALUE "Eau : ".
           05 WS-EAU-RESULT       PIC Z(3)9.999.
           05 FILLER              PIC XXX       VALUE " l".

       01 WS-INPUT            PIC 99.
       01 WS-PIZZA            PIC 99V9    VALUE 0.
       01 WS-COUNT            PIC 9.
       01 WS-PIZZA-ROUNDED    PIC 99.
       01 WS-FARINE           PIC 9(6)V999.
       01 WS-LEVURE           PIC 9(4)V999.
       01 WS-BEURRE           PIC 9(4)V999.
       01 WS-EAU              PIC 9(4)V999.
       01 WS-FARINE-QUANTITY  PIC 9(6)     VALUE 250.
       01 WS-LEVURE-QUANTITY  PIC 9(4)     VALUE 10.
       01 WS-BEURRE-QUANTITY  PIC 9(4)     VALUE 12.
       01 WS-EAU-QUANTITY     PIC 9(4)     VALUE 20.
       01 WS-PRIX-PIZZA       PIC 9(2)     VALUE 10.
       01 WS-PRIX-FARINE      PIC 9V99  VALUE 1.65.
       01 WS-PRIX-LEVURE      PIC 9     VALUE 2.
       01 WS-PRIX-BEURRE      PIC 9V9   VALUE 7.2.
       01 WS-PRIX-TOTAL       PIC 999V99.
      
       PROCEDURE DIVISION.
       
       DISPLAY WS-MSG.
       ACCEPT WS-INPUT.

       PERFORM UNTIL WS-PIZZA = WS-INPUT * 1.1
           ADD 1.1 TO WS-PIZZA
           DISPLAY WS-PIZZA
       END-PERFORM. 

       INSPECT WS-PIZZA TALLYING WS-COUNT FOR CHARACTERS 
           AFTER INITIAL '0'.  

       IF WS-COUNT > 0
          COMPUTE WS-PIZZA-ROUNDED EQUAL WS-PIZZA + 1
       ELSE 
           MOVE WS-PIZZA TO WS-PIZZA-ROUNDED
       END-IF.

       DISPLAY WS-PIZZA-ROUNDED.
       
       PERFORM WS-PIZZA-ROUNDED TIMES
           COMPUTE WS-FARINE = WS-FARINE + WS-FARINE-QUANTITY
           COMPUTE WS-LEVURE = WS-LEVURE + WS-LEVURE-QUANTITY
           COMPUTE WS-BEURRE = WS-BEURRE + WS-BEURRE-QUANTITY
           COMPUTE WS-EAU = WS-EAU + WS-EAU-QUANTITY
       END-PERFORM.

       COMPUTE WS-FARINE = WS-FARINE / 1000.
       COMPUTE WS-LEVURE = WS-LEVURE / 1000.
       COMPUTE WS-BEURRE = WS-BEURRE / 1000.
       COMPUTE WS-EAU = WS-EAU / 100.

       MOVE WS-FARINE TO WS-FARINE-RESULT.
       MOVE WS-LEVURE TO WS-LEVURE-RESULT.
       MOVE WS-BEURRE TO WS-BEURRE-RESULT.
       MOVE WS-EAU TO WS-EAU-RESULT.

       DISPLAY WS-TAB-INGREDIENTS.

       COMPUTE WS-PRIX-TOTAL = WS-PRIX-PIZZA - 
           ((WS-PRIX-FARINE * (WS-FARINE-QUANTITY / 1000)) + 
           (WS-PRIX-LEVURE * (WS-LEVURE-QUANTITY / 1000)) +
           (WS-PRIX-BEURRE * (WS-BEURRE-QUANTITY / 1000)))

       DISPLAY "Rentabilité d'une pizza : " WS-PRIX-TOTAL.
       MULTIPLY WS-PRIX-TOTAL BY WS-PIZZA-ROUNDED GIVING WS-PRIX-TOTAL.
       DISPLAY "Rentabilité total : " WS-PRIX-TOTAL.

       STOP RUN.

       
       