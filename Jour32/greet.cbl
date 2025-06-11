       IDENTIFICATION DIVISION.
       PROGRAM-ID. greet.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.
       LINKAGE SECTION.
       
       01 LK-NOM    PIC X(20).
       01 LK-RESULT PIC X(30).

       PROCEDURE DIVISION USING LK-NOM LK-RESULT.

           STRING "Bonjour, " LK-NOM INTO LK-RESULT.

       END PROGRAM "greet".    
       
       