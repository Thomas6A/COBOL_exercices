       IDENTIFICATION DIVISION.
       PROGRAM-ID. copie.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       SELECT COMPTE-RENDU ASSIGN TO "compte-rendu.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       SELECT COPIE-FICHIER ASSIGN TO "copie.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD COMPTE-RENDU.
       01 F-LINE            PIC X(48).

       FD COPIE-FICHIER.
       01 F-LINE-COPIE      PIC X(48).

       WORKING-STORAGE SECTION.
       
       01 WS-LINE-TAB.
           05 WS-LINES      OCCURS 30 TIMES.
               10 WS-LINE   PIC X(48).

       77 WS-TAB-MAX        PIC 99                    VALUE 30.
       77 WS-INDEX          PIC 99                    VALUE 1.
       77 WS-FIN-FICHIER    PIC X                     VALUE 'F'.

       PROCEDURE DIVISION.
       
       OPEN INPUT COMPTE-RENDU.

       PERFORM UNTIL WS-FIN-FICHIER = 'T'

           READ COMPTE-RENDU

               AT END
                   MOVE 'T' TO WS-FIN-FICHIER

               NOT AT END
                   MOVE F-LINE TO WS-LINE(WS-INDEX)
                   ADD 1 TO WS-INDEX
           
           END-READ

       END-PERFORM.

       CLOSE COMPTE-RENDU.

       OPEN OUTPUT COPIE-FICHIER

       PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-TAB-MAX

           IF WS-LINE(WS-INDEX) NOT EQUAL SPACES
               
               MOVE WS-LINE(WS-INDEX) TO F-LINE-COPIE
               WRITE F-LINE-COPIE

           END-IF

       END-PERFORM.

       CLOSE COPIE-FICHIER.

       STOP RUN.        
       