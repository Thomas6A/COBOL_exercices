       IDENTIFICATION DIVISION.
       PROGRAM-ID. chaine.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
       01 WS-TABLE-PERSONNE.
           05 WS-PERSONNE    OCCURS 5 TIMES INDEXED BY WS-INDEX.
               10 FILLER     PIC X(5)    VALUE "Nom: ".
               10 WS-NOM     PIC X(20).
               10 FILLER     PIC X(9)    VALUE " Prenom: ".
               10 WS-PRENOM  PIC X(20).
               10 FILLER     PIC X(6)    VALUE " Age: ".
               10 WS-AGE     PIC 99.
               10 FILLER     PIC X       VALUE X"0A".
       
       01 WS-INPUT           PIC X(45).
       01 WS-INPUT-MENU      PIC 9.

       PROCEDURE DIVISION.
       
       PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX = 6

           DISPLAY "Entrez une personne (nom prenom age)"
           ACCEPT WS-INPUT

           UNSTRING WS-INPUT DELIMITED BY SPACE INTO WS-NOM(WS-INDEX) 
               WS-PRENOM(WS-INDEX) WS-AGE(WS-INDEX)

       END-PERFORM.

       PERFORM UNTIL WS-INPUT-MENU = 3

           DISPLAY "Choisissez une option : "
           DISPLAY "1- Afficher toutes les personnes"
           DISPLAY "2- Afficher une personne spécifiques"
           DISPLAY "3- Quitter"
           ACCEPT WS-INPUT-MENU

           MOVE 1 TO WS-INDEX

           EVALUATE WS-INPUT-MENU

               WHEN 1
                  DISPLAY WS-TABLE-PERSONNE
               WHEN 2 
                  PERFORM UNTIL WS-INPUT = "QUIT"
                      DISPLAY "Saisir le nom de l'individu"
                      DISPLAY "QUIT pour quitter"
                      ACCEPT WS-INPUT

                      SEARCH WS-PERSONNE VARYING WS-INDEX
                          AT END DISPLAY "Individu non trouvé"
                          WHEN WS-NOM(WS-INDEX) = WS-INPUT
                              DISPLAY WS-PERSONNE(WS-INDEX)
                      END-SEARCH
                      
                  END-PERFORM
               WHEN 3 
                  CONTINUE
               WHEN OTHER
                  DISPLAY "Erreur de saisi"
           END-EVALUATE
           
       END-PERFORM.
       
       


       STOP RUN.
       