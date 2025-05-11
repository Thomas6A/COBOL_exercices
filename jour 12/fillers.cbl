       IDENTIFICATION DIVISION. 
       PROGRAM-ID. fillers.

       DATA DIVISION. 

       WORKING-STORAGE SECTION.
       
       01 WS-TAB-NOTE.
           05 WS-NOTES    OCCURS 100 TIMES.
              10 FILLER      PIC X(7)       VALUE "Note : ".
              10 WS-NOTE     PIC 99.
              10 FILLER      PIC X(4)       VALUE " le ".
              10 WS-DATE.
                 15 WS-JOUR  PIC 99.
                 15 FILLER   PIC X       VALUE "/".
                 15 WS-MOIS  PIC 99.
                 15 FILLER   PIC X       VALUE "/".
                 15 WS-ANNE  PIC 9(4).
                 15 FILLER   PIC X       VALUE " ".
       
       01 WS-INDEX              PIC 9(3).
       01 WS-INPUT              PIC 9(3).


       PROCEDURE DIVISION.

           PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX = 100 
           
              DISPLAY "Saisir la note (99 pour quitter)"
              ACCEPT WS-INPUT
              IF WS-INPUT = 99
                 EXIT PERFORM
              END-IF
              MOVE WS-INPUT TO WS-NOTE(WS-INDEX)

              DISPLAY "Saisir le jour"
              ACCEPT WS-JOUR(WS-INDEX)

              DISPLAY "Saisir le mois"
              ACCEPT WS-MOIS(WS-INDEX)

              DISPLAY "Saisir l'année "
              ACCEPT WS-ANNE(WS-INDEX)

              DISPLAY WS-NOTES(WS-INDEX)
       
           END-PERFORM.

       
           STOP RUN.

