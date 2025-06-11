       IDENTIFICATION DIVISION.
       PROGRAM-ID. usermain.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       
       FILE-CONTROL.

       SELECT FICHIER-USER ASSIGN TO "users.dat" 
           ORGANIZATION IS LINE SEQUENTIAL.

       SELECT FICHIER-LOG ASSIGN TO "errors.log"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD FICHIER-USER.
       COPY "user.cpy".

       FD FICHIER-LOG.
       01 F-LOG    PIC X(84).

       WORKING-STORAGE SECTION.
       
       01 WS-USER-TAB.
           05 WS-USER    OCCURS 3 TIMES.
               10 WS-ID-USER    PIC 9(10).
               10 WS-NOM        PIC X(50).
               10 WS-EMAIL      PIC X(50).
               10 WS-CODE       PIC 9.

       77 WS-INDEX        PIC 9    VALUE 0.
       77 WS-MAX-TAB      PIC 9.
       77 WS-EOF          PIC X    VALUE 'F'.

       PROCEDURE DIVISION.

           OPEN INPUT FICHIER-USER.

           PERFORM UNTIL WS-EOF = 'T'

               READ FICHIER-USER

                   AT END
                       MOVE 'T' TO WS-EOF
                       MOVE WS-INDEX TO WS-MAX-TAB

                   NOT AT END
                       ADD 1 TO WS-INDEX
                       MOVE USER-RECORD TO WS-USER(WS-INDEX)

               END-READ

           END-PERFORM.

           CLOSE FICHIER-USER.

           PERFORM VARYING WS-INDEX FROM 1 BY 1 
               UNTIL WS-INDEX > WS-MAX-TAB

               CALL "validate" USING WS-USER(WS-INDEX)

               MOVE RETURN-CODE TO WS-CODE(WS-INDEX)


           END-PERFORM.    

           OPEN OUTPUT FICHIER-LOG.

           PERFORM VARYING WS-INDEX FROM 1 BY 1 
               UNTIL WS-INDEX > WS-MAX-TAB

               IF WS-CODE(WS-INDEX) = 1

                   STRING "[Ligne "
                          WS-INDEX
                          "] Erreur : Email invalide "
                          WS-EMAIL(WS-INDEX)
                          INTO F-LOG
                   END-STRING

                   WRITE F-LOG
                   
               ELSE IF WS-CODE(WS-INDEX) = 2   

                   STRING "[Ligne "
                          WS-INDEX
                          "] Erreur : id invalide "
                          WS-EMAIL(WS-INDEX)
                          INTO F-LOG
                   END-STRING

                   WRITE F-LOG

               END-IF


           END-PERFORM.    

           CLOSE FICHIER-LOG.

       STOP RUN.    

       
       