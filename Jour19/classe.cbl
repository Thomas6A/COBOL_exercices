      *Créer un tableau multidimensionnel de noms et prénoms d'élèves 
      *dans deux classes (CM1 et CM2) directement depuis le terminal. 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. classe.
       AUTHOR. Thomas Baudrin.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.

      *Tableaux ayant 2 classes qui ont chacun 6 élèves ayant chacun
      *un nom et un prénom 
       01 WS-ELEVES-TAB.
           05 WS-CLASSE                 OCCURS 2 TIMES.
               10 WS-ELEVE              OCCURS 6 TIMES.
                   15 WS-NOM-ELEVE      PIC X(15).
                   15 WS-PRENOM-ELEVE   PIC X(15).

      *Index de la classe
       77 WS-INDEX-CLASSE               PIC 9.
      *Index des élèves 
       77 WS-INDEX-ELEVE                PIC 9.

      ******************************************************************

       PROCEDURE DIVISION.
       
      *Boucle itérant sur les classes pour la saisi
           PERFORM VARYING WS-INDEX-CLASSE FROM 1 BY 1 
               UNTIL WS-INDEX-CLASSE > 2
      
      *Boucle itérant sur les élèves pour la saisi
               PERFORM VARYING WS-INDEX-ELEVE FROM 1 BY 1 
                   UNTIL WS-INDEX-ELEVE > 6
      
      *Affichages des instructions et saisi de l'utilisateur
                   DISPLAY "Entrer le nom de l'élève " 
                       WS-INDEX-ELEVE " de CM" WS-INDEX-CLASSE
                   ACCEPT WS-NOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)  
      
      *Affichages des instructions et saisi de l'utilisateur
                   DISPLAY "Entrer le prénom de l'élève " 
                       WS-INDEX-ELEVE " de CM" WS-INDEX-CLASSE
                   ACCEPT 
                       WS-PRENOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE) 
      
               END-PERFORM
      
           END-PERFORM.
      
      *Boucle itérant sur les classes pour l'affichage
           PERFORM VARYING WS-INDEX-CLASSE FROM 1 BY 1 
               UNTIL WS-INDEX-CLASSE > 2

      *Affichage de la classe actuelle
               DISPLAY "Classe de CM" WS-INDEX-CLASSE
      
      *Boucle itérant sur les élèves pour l'affichage'
               PERFORM VARYING WS-INDEX-ELEVE FROM 1 BY 1 
                   UNTIL WS-INDEX-ELEVE > 6
      
      *Affichage des noms et prénoms de chaque élèves
                   DISPLAY "Nom : " 
                       WS-NOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)
                   SPACE WITH NO ADVANCING
                   DISPLAY ", Prénom : " 
                       WS-PRENOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)    
      
               END-PERFORM
      
           END-PERFORM.

           STOP RUN.

                 
       