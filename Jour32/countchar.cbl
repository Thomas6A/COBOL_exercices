       IDENTIFICATION DIVISION.
       PROGRAM-ID. countchar.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.
       
       LINKAGE SECTION.
       
       01 LK-NOM       PIC X(20).
       01 LK-COUNT     PIC 99.

       PROCEDURE DIVISION USING LK-NOM LK-COUNT.

           MOVE FUNCTION LENGTH(FUNCTION TRIM(LK-NOM)) TO LK-COUNT.

       END PROGRAM "countchar".    
       

       