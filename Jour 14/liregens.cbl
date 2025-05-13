       IDENTIFICATION DIVISION.
       PROGRAM-ID. liregens.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
      *Association de variables au fichier text gens séquencé en ligne 
           SELECT FICHIER-PERSONNES ASSIGN TO "gens.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.

       FILE SECTION.

      *Définition de FICHIER-PERSONNES avec chaque ligne ayant une 
      *personne que l'on divise en un nom et prénom
       FD FICHIER-PERSONNES.
       01 F-PERSONNE.
           05 F-NOM            PIC X(12).
           05 F-PRENOM         PIC X(12).

       WORKING-STORAGE SECTION.

      *Tableau pour stocker les informations du fichier
       01 WS-PERSONNE-TAB.
           05 WS-PERSONNE      OCCURS 10 TIMES.
               10 WS-NOM       PIC X(12).
               10 WS-PRENOM    PIC X(12).

      *Index du tableau
       77 WS-INDEX             PIC 99                VALUE 1.
      *Taille maximum du fichier 
       77 WS-MAX-FICHIER       PIC 99                VALUE 10.
      *Boolean pour savoir si on est au bout du fichier 
       77 WS-FIN-FICHIER       PIC X                 VALUE 'N'.

       PROCEDURE DIVISION.
       
      *Ouverture du fichier 
       OPEN INPUT FICHIER-PERSONNES.

      *Boucle 'arretant au bout du fichier
       PERFORM UNTIL WS-FIN-FICHIER = 'Y'

      *Lecture du fichier, à la fin on change WS-FIN-FICHIER sinon
      *on associe les nom et prénom au tableau
           READ FICHIER-PERSONNES 
               AT END MOVE 'Y' TO WS-FIN-FICHIER
               NOT AT END
                  MOVE F-NOM TO WS-NOM(WS-INDEX)
                  MOVE F-PRENOM TO WS-PRENOM(WS-INDEX)
                  ADD 1 TO WS-INDEX

           END-READ    
               
       END-PERFORM.

      *Boucle pour l'affichage
       PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX > WS-MAX-FICHIER

           DISPLAY "Nom : " WS-NOM(WS-INDEX)
           SPACE WITH NO ADVANCING
           DISPLAY "Prenom : " WS-PRENOM(WS-INDEX)

       END-PERFORM.

       CLOSE FICHIER-PERSONNES.

       STOP RUN.

