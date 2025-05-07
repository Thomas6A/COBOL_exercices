       IDENTIFICATION DIVISION.
       PROGRAM-ID. todo.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
       01 WS-LIST.
           05 WS-TASK        PIC X(100)        OCCURS 5.
       
       01 WS-INPUT           PIC 9.
       
       