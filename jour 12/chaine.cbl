       IDENTIFICATION DIVISION.
       PROGRAM-ID. chaine.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Tableaux de Pesonnes ayant 5 itérations ayant chacun un nom, un
      *prénom et un age le tout entrecouper de filler pour la mise en 
      *forme le tout indexé par WS-INDEX
       01 WS-TABLE-PERSONNE.
           05 WS-PERSONNE    OCCURS 5 TIMES INDEXED BY WS-INDEX.
               10 FILLER     PIC X(5)    VALUE "Nom: ".
               10 WS-NOM     PIC X(20).
               10 FILLER     PIC X(9)    VALUE " Prenom: ".
               10 WS-PRENOM  PIC X(20).
               10 FILLER     PIC X(6)    VALUE " Age: ".
               10 WS-AGE     PIC 99.
               10 FILLER     PIC X       VALUE X"0A".
       
      *Variable de la saisi de l'utilisateur 
       01 WS-INPUT           PIC X(45).
      *Variable de la saisi de l'utilisateur pour le menu 
       01 WS-INPUT-MENU      PIC 9.

       PROCEDURE DIVISION.
       
      *Boucle pour saisir les différents utilisateurs 
       PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX = 6

      *Affichage de l'instruction et saisi de l'utilisateur
           DISPLAY "Entrez une personne (nom prenom age)"
           ACCEPT WS-INPUT

      *UNSTRING permettant de séparer la string via les espaces 
      *dans plusieurs variables
           UNSTRING WS-INPUT DELIMITED BY SPACE INTO WS-NOM(WS-INDEX) 
               WS-PRENOM(WS-INDEX) WS-AGE(WS-INDEX)

       END-PERFORM.

      *Boucle permettant l'affichage du menu s'arretant quand 
      *l'utilisateur quitte
       PERFORM UNTIL WS-INPUT-MENU = 3

      *Affichage du menu et saisi de l'utilisateur
           DISPLAY "Choisissez une option : "
           DISPLAY "1- Afficher toutes les personnes"
           DISPLAY "2- Afficher une personne spécifiques"
           DISPLAY "3- Quitter"
           ACCEPT WS-INPUT-MENU

      *Réinitialisation de l'index
           MOVE 1 TO WS-INDEX

      *Condition vérifiant la saisi de l'utilisateur
           EVALUATE WS-INPUT-MENU

      *Si 1 on affiche le tableau
               WHEN 1

                  DISPLAY WS-TABLE-PERSONNE

      *Si 2 on affiche un utilisateur particulier
               WHEN 2 
      
      *Boucle pour saisir des utilisateur jusqu'a ce que l'utilisateur 
      *quitte
                  PERFORM UNTIL WS-INPUT = "QUIT"
                  
      *Affichage du menu et saisi de l'utilisateur            
                      DISPLAY "Saisir le nom de l'individu"
                      DISPLAY "QUIT pour quitter"
                      ACCEPT WS-INPUT

      *Condition vérifiant que l'utilisateur n'a pas saisi QUIT
                      IF WS-INPUT NOT EQUAL "QUIT"

      *Fonction search permettant de rechercher par le nom de 
      *l'utilisateur dans le tableau 
      *Si on arrive à la fin du tableau sans trouver message d'erreur
                          SEARCH WS-PERSONNE VARYING WS-INDEX
                              AT END DISPLAY "Individu non trouvé"

                              WHEN WS-NOM(WS-INDEX) = WS-INPUT
                                  DISPLAY WS-PERSONNE(WS-INDEX)

                          END-SEARCH
                      END-IF
                  END-PERFORM

               WHEN 3 

                  CONTINUE

               WHEN OTHER

                  DISPLAY "Erreur de saisi"

           END-EVALUATE
           
       END-PERFORM.
       
       


       STOP RUN.
       