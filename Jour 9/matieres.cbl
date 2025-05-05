      *Saisir les notes de 3 élèves pour 4 matières, en utilisant un 
      *tableau multidimensionnel . Afficher toutes les notes.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. matieres.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Tableau de 3 élèves ayant chacun un nom et un autre tableau 
      *matieres ayant un nom et une note associé
       01 WS-ELEVES.
           05 WS-ELEVE            OCCURS 3 TIMES.
               10 WS-MATIERES     OCCURS 4 TIMES.
                   15 WS-MATIERE  PIC X(20).
                   15 WS-NOTE     PIC 99.
               10 WS-NOM-ELEVE    PIC X(20).
       
      *Index du tableau élève 
       01 WS-INDEX-ELEVE          PIC 9.
      *Index du tableau matières 
       01 WS-INDEX-MATIERES       PIC 9.

       PROCEDURE DIVISION.
       
      *Boucle itérant le tableau élève pour la saisi des valeurs 
       PERFORM VARYING WS-INDEX-ELEVE FROM 0 BY 1 
           UNTIL WS-INDEX-ELEVE = 3

      *Affichage de l'instruction et saisi de l'utilisateur pour le nom
      *de l'élève
           DISPLAY "Entrez le nom de l'élève"
           ACCEPT WS-NOM-ELEVE(WS-INDEX-ELEVE)

      *Boucles itérant le tableau matières pour la saisi de matière
      *et de la note associé
           PERFORM VARYING WS-INDEX-MATIERES FROM 1 BY 1 
               UNTIL WS-INDEX-MATIERES > 4

      *Affichage de l'instruction et saisi de l'utilisateur pour la
      *matière
               DISPLAY "Entrez la matière"
               ACCEPT WS-MATIERE(WS-INDEX-ELEVE,WS-INDEX-MATIERES)

      *Affichage de l'instruction et saisi de l'utilisateur pour la note
               DISPLAY "Entrez la note"
               ACCEPT WS-NOTE(WS-INDEX-ELEVE,WS-INDEX-MATIERES)

           END-PERFORM
       
       END-PERFORM.

      *Boucle itérant le tableau élève pour l'affichage
       PERFORM VARYING WS-INDEX-ELEVE FROM 0 BY 1 
           UNTIL WS-INDEX-ELEVE = 3

           DISPLAY WS-NOM-ELEVE(WS-INDEX-ELEVE) " : "

      *Boucle itérant le tableau matière pour l'affichage
           PERFORM VARYING WS-INDEX-MATIERES FROM 1 BY 1 
               UNTIL WS-INDEX-MATIERES > 4
           
               DISPLAY WS-MATIERE(WS-INDEX-ELEVE,WS-INDEX-MATIERES)
                   " : "

               DISPLAY WS-NOTE(WS-INDEX-ELEVE,WS-INDEX-MATIERES) " , "

           END-PERFORM
       
       END-PERFORM.

       STOP RUN.
