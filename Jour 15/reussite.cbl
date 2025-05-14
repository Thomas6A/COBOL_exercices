       IDENTIFICATION DIVISION.
       PROGRAM-ID. reussite.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      *Alias du fichier eleves lu ligne par ligne
       SELECT FICHIER-ELEVES ASSIGN TO "eleves.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

      *Alias du fichier reussite écris ligne par ligne
       SELECT FICHIER-REUSSITE ASSIGN TO "reussite.txt"
           ORGANIZATION IS LINE SEQUENTIAL.


       DATA DIVISION.

       FILE SECTION.

      *Définition du fichier élèves, chaque ligne contenant un élève
      *ayant chacun un nom et une note
       FD FICHIER-ELEVES.
       01 F-ELEVE.
           05 F-NOM                PIC X(10).
           05 F-NOTE               PIC 99.

      *Définition du fichier reussite, chaque ligne contenant un élève
      *ayant chacun un nom et une note
       FD FICHIER-REUSSITE.
       01 F-ELEVE-REUSSITE.
           05 F-NOM-REUSSITE       PIC X(10).
           05 F-NOTE-REUSSITE      PIC 99.

       WORKING-STORAGE SECTION.

      *Tableau contenant tous les élèves du fichier
       01 WS-ELEVES-TAB.
           05 WS-ELEVE             OCCURS 15 .
               10 WS-NOM           PIC X(10).
               10 WS-NOTE          PIC 99.

      *Variable ayant la taille max du tableau de valeur 15
       77 WS-MAX-TAB               PIC 99                VALUE 15.
      *Variable contenant l'index du tableau initialisé à 1 
       77 WS-INDEX                 PIC 99                VALUE 1.
      *Variable vérifiant si on est arrivé au bout du fichier 
       77 WS-FIN-FICHIER           PIC X                 VALUE 'F'.


       PROCEDURE DIVISION.

      *Ouverture du fichier eleves 
       OPEN INPUT FICHIER-ELEVES.

      *Boucle permettant d'itérer chaque ligne du fichier
       PERFORM UNTIL WS-FIN-FICHIER = 'T'
           
      *Instruction permettant de lire le fichier     
           READ FICHIER-ELEVES

      *A la fin du fichier on change la valeur de WS-FIN-FICHIER afin
      *de quitter la boucle
               AT END
                   MOVE 'T' TO WS-FIN-FICHIER

      *Tant que ce n'est pas terminer on ajoute les données du fichier
      *au tableau
               NOT AT END
                   MOVE F-NOM TO WS-NOM(WS-INDEX)
                   MOVE F-NOTE TO WS-NOTE(WS-INDEX)
                   INSPECT WS-NOTE(WS-INDEX) REPLACING LEADING SPACE
                   BY ZERO
                   ADD 1 TO WS-INDEX

           END-READ

       END-PERFORM.

       CLOSE FICHIER-ELEVES.

      *Ouverture du fichier reussiter
       OPEN OUTPUT FICHIER-REUSSITE.

      *Boucle permettant d'itérer sur tout le tableau
       PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-MAX-TAB

      *Condition vérifiant si la note est supérieur à 10
           IF WS-NOTE(WS-INDEX) > 10

      *Si oui on associe les donnée du tableau au fichier et on l'écrit
               MOVE WS-NOM(WS-INDEX) TO F-NOM-REUSSITE
               MOVE WS-NOTE(WS-INDEX) TO F-NOTE-REUSSITE
               WRITE F-ELEVE-REUSSITE

           END-IF

       END-PERFORM.

       CLOSE FICHIER-REUSSITE.

       STOP RUN.
