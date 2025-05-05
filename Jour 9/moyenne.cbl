      *Saisir 5 notes dans un tableau, calculer et afficher la moyenne.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. moyenne.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Tableau de 5 notes chacune étant un entier de 2 chiffres 
       01 WS-NOTES.
           05 WS-NOTE        PIC 99        OCCURS 5 TIMES.
       
      *Index du tableau WS-NOTES 
       01 WS-INDEX           PIC 9.
      *Variable de la somme des notes permettant le calcul de la moyenne
       01 WS-SOMME           PIC 9(3)      VALUE 0.
      *Variable de la moyenne des notes 
       01 WS-MOYENNE         PIC 99V99     VALUE 0.

       PROCEDURE DIVISION.
       
      *Boucle permettant itérer le tableau WS-NOTES 
       PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > 5

      *Affichage d'instruction et saisi de l'utilisateur d'une note
           DISPLAY "Entrez note " WS-INDEX
           ACCEPT WS-NOTE(WS-INDEX)

      *Ajout de la note à la somme     
           ADD WS-NOTE(WS-INDEX) TO WS-SOMME

       END-PERFORM.

      *Calcul et affichage de la moyenne
       COMPUTE WS-MOYENNE = WS-SOMME/5.
       DISPLAY "Moyenne : " WS-MOYENNE.

       STOP RUN.



       