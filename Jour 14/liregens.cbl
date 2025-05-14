       IDENTIFICATION DIVISION.
       PROGRAM-ID. liregens.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
      *Alias du fichier text gens lu ligne par ligne
           SELECT FICHIER-PERSONNES ASSIGN TO "gens.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

      *Alias du fichier text gens-clone écris ligne par ligne
           SELECT FICHIER-CLONE ASSIGN TO "gens-clone.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

      *Alias du fichier text gens-inverse écris ligne par ligne
           SELECT FICHIER-INVERSE ASSIGN TO "gens-inverse.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.

       FILE SECTION.

      *Définition de FICHIER-PERSONNES avec chaque ligne ayant une 
      *personne que l'on divise en un nom et prénom
       FD FICHIER-PERSONNES.
       01 F-PERSONNE.
           05 F-NOM            PIC X(12).
           05 F-PRENOM         PIC X(12).

      *Définition de FICHIER-CLONE avec chaque ligne ayant une 
      *personne que l'on divise en un nom et prénom
       FD FICHIER-CLONE.
       01 F-PERSONNE-CLONE.
           05 F-NOM-CLONE      PIC X(12).
           05 F-PRENOM-CLONE   PIC X(12).

      *Définition de FICHIER-INVERSE avec chaque ligne ayant une 
      *personne que l'on divise en un nom et prénom
       FD FICHIER-INVERSE.
       01 F-PERSONNE-INVERSE.
           05 F-NOM-INVERSE    PIC X(12).
           05 F-PRENOM-INVERSE PIC X(12).    

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

       CLOSE FICHIER-PERSONNES.

      *Boucle pour l'affichage
       PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX > WS-MAX-FICHIER

           DISPLAY "Nom : " WS-NOM(WS-INDEX)
           SPACE WITH NO ADVANCING
           DISPLAY "Prenom : " WS-PRENOM(WS-INDEX)

       END-PERFORM.

      *Ouverture du fichier clone
       OPEN OUTPUT FICHIER-CLONE.

      *Boucle parcourant le tableau pour associer et écrire les 
      *personnes dans le fichier clone
       PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX > WS-MAX-FICHIER   

           MOVE WS-NOM(WS-INDEX) TO F-NOM-CLONE
           MOVE WS-PRENOM(WS-INDEX) TO F-PRENOM-CLONE
           WRITE F-PERSONNE-CLONE

       END-PERFORM.

      *Fermeture du fichier clone
       CLOSE FICHIER-CLONE.

      *Ouvrture du fichier inverse
       OPEN OUTPUT FICHIER-INVERSE.

      *Boucle parcourant le tableau dans les sens inverse 
      *pour associer et écrire les personnes dans le fichier clone
       PERFORM VARYING WS-INDEX FROM WS-MAX-FICHIER BY -1 
           UNTIL WS-INDEX < 1  

           MOVE WS-NOM(WS-INDEX) TO F-NOM-INVERSE
           MOVE WS-PRENOM(WS-INDEX) TO F-PRENOM-INVERSE
           WRITE F-PERSONNE-INVERSE

       END-PERFORM.
      
      *Fermeture du fichier inverse
       CLOSE FICHIER-INVERSE.
       
       STOP RUN.

