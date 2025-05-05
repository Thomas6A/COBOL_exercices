       IDENTIFICATION DIVISION.
       PROGRAM-ID. todoAlt.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Les variables WS-TASK sont des alphanumériques de 100 caractères
       01  WS-TASK-1    PIC X(100) VALUE "djvbzdcbn".
       01  WS-TASK-2    PIC X(100).
       01  WS-TASK-3    PIC X(100).
       01  WS-TASK-4    PIC X(100).
       01  WS-TASK-5    PIC X(100).

       SCREEN SECTION.
       01 ECRAN-TASKS.
           02 BLANK SCREEN BACKGROUND-COLOR 4 BLINK.
           02 LINE 1 COL 1 BACKGROUND-COLOR 8  
               FOREGROUND-COLOR 3 PIC X(70) VALUE "TASK1".
           02 LINE 1 COL 10 BACKGROUND-COLOR 2
               PIC X(70) USING WS-TASK-1.
           02 LINE 5 COL 1 PIC X(70) VALUE "TASK2".
           02 LINE 5 COL 10 PIC X(70) USING WS-TASK-2.
           02 LINE 10 COL 1 PIC X(70) VALUE "TASK3".
           02 LINE 10 COL 10 PIC X(70) USING WS-TASK-3.
           02 LINE 15 COL 1 PIC X(70) VALUE "TASK4".
           02 LINE 15 COL 10 PIC X(70) USING WS-TASK-4.
           02 LINE 20 COL 1 PIC X(70) VALUE "TASK5".
           02 LINE 20 COL 10 PROMPT CHARACTER IS "*" PIC X(70) 
               USING WS-TASK-5.



       PROCEDURE DIVISION.
           
           DISPLAY ECRAN-TASKS.
           ACCEPT ECRAN-TASKS.
           DISPLAY ECRAN-TASKS.

       STOP RUN.
