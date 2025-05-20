      *Lire un fichier texte contenant les noms et prénoms d’élèves, 
      *puis permettre à l’utilisateur de rechercher un nom de famille 
      *pour afficher la liste des prénoms associés à ce nom dans la 
      *classe correspondante.
       IDENTIFICATION DIVISION.
       PROGRAM-ID. fichclass.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      *Alias du fichier input-classes lu ligne par ligne
       SELECT FICHIER-CLASSES ASSIGN TO "input-classes.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

      *Définition du fichier, chaque ligne ayant un élève chacun ayant
      *une classe, un nom et un prénom
       FD FICHIER-CLASSES.
       01 F-ELEVE.
           05 F-CLASSE        PIC X(3).
           05 FILLER          PIC X(2).
           05 F-NOM           PIC X(9).
           05 F-PRENOM        PIC X(9).


       WORKING-STORAGE SECTION.

      *Tableaux ayant 2 classes qui ont chacun 6 élèves ayant chacun
      *un nom et un prénom 
       01 WS-ELEVES-TAB.
           05 WS-CLASSE                 OCCURS 2 TIMES.
               10 WS-ELEVE              OCCURS 8 TIMES.
                   15 WS-NOM-ELEVE      PIC X(9).
                   15 WS-PRENOM-ELEVE   PIC X(9).

      *Index de la classe
       77 WS-INDEX-CLASSE               PIC 9.
      *Index des élèves 
       77 WS-INDEX-ELEVE                PIC 9.
      *Index des élèves de la classe de CM1 
       77 WS-INDEX-ELEVE-1              PIC 9                VALUE 0.
      *Index des élèves de la classe de CM2 
       77 WS-INDEX-ELEVE-2              PIC 9                VALUE 0.
      *Boolean vérifiant si le fichier est fini 
       77 WS-EOF                        PIC X                VALUE "F".
      *Variable du nombre maximal d'élèves dans une classe 
       77 WS-MAX-ELEVE                  PIC 9.
       77 WS-INPUT                      PIC X(9).


      ******************************************************************

       PROCEDURE DIVISION.

      *Ouverture du fichier
           OPEN INPUT FICHIER-CLASSES.

      *Boucle permettant d'itérer chaque ligne du fichier
           PERFORM UNTIL WS-EOF = "T"

      *Instruction permettant de lire le fichier
               READ FICHIER-CLASSES

      *A la fin du fichier on change la variable WS-EOF
                   AT END
                       MOVE "T" TO WS-EOF

      *Sinon on associe les données du fichier au tableau
                   NOT AT END

      *Condition vérifiant la classe de l'élève est CM1             
                       IF F-CLASSE = "CM1"

      *Si oui on associe l'index de la classe à 1 puis on augmente de 1
      *l'index des élèves de la classe 1 pour l'associer à l'index des
      *élèves
                          MOVE 1 TO WS-INDEX-CLASSE
                          ADD 1 TO WS-INDEX-ELEVE-1
                          MOVE WS-INDEX-ELEVE-1 TO WS-INDEX-ELEVE
                   
                       ELSE 

      *Si non on associe l'index de la classe à 2 puis on augmente de 1
      *l'index des élèves de la classe 2 pour l'associer à l'index des
      *élèves  
                          MOVE 2 TO WS-INDEX-CLASSE
                          ADD 1 TO WS-INDEX-ELEVE-2
                          MOVE WS-INDEX-ELEVE-2 TO WS-INDEX-ELEVE 

                       END-IF
      
      *Ensuite on associe les valeurs du fichier au tableaux aux index
      *associé
                       MOVE F-NOM 
                           TO WS-NOM-ELEVE
                               (WS-INDEX-CLASSE, WS-INDEX-ELEVE)
                       MOVE F-PRENOM 
                           TO WS-PRENOM-ELEVE
                               (WS-INDEX-CLASSE, WS-INDEX-ELEVE)

               END-READ

           END-PERFORM.

      *Fermeture du fichier
           CLOSE FICHIER-CLASSES.

      *Condition vérifiant quelle index est le plus élevé pour 
      *l'associer au nombre max d'élèves
           IF WS-INDEX-ELEVE-1 > WS-INDEX-ELEVE-2
           
               MOVE WS-INDEX-ELEVE-1 TO WS-MAX-ELEVE

           ELSE 

               MOVE WS-INDEX-ELEVE-2 TO WS-MAX-ELEVE

           END-IF.    

      *Boucle itérant sur les classes pour l'affichage
           PERFORM VARYING WS-INDEX-CLASSE FROM 1 BY 1 
               UNTIL WS-INDEX-CLASSE > 2

      *Affichage de la classe actuelle
               DISPLAY "Classe de CM" WS-INDEX-CLASSE
      
      *Boucle itérant sur les élèves pour l'affichage s'arrêtant si
      *on dépasse le nombre max d'élèves ou si il n'y a pas d'élèves
               PERFORM VARYING WS-INDEX-ELEVE FROM 1 BY 1 
                   UNTIL WS-INDEX-ELEVE > WS-MAX-ELEVE
                   OR WS-NOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE) 
                   EQUAL SPACES
      
      *Affichage des noms et prénoms de chaque élèves
                   DISPLAY "Nom : " 
                       WS-NOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)
                   SPACE WITH NO ADVANCING
                   DISPLAY ", Prénom : " 
                       WS-PRENOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)    
      
               END-PERFORM
      
           END-PERFORM.

      *Affichage de l'instruction et saisi de l'utilisateur
           DISPLAY "Entrez un nom à cherché".
           ACCEPT WS-INPUT.

      *Boucle itérant sur les classes pour la recherche
           PERFORM VARYING WS-INDEX-CLASSE FROM 1 BY 1 
               UNTIL WS-INDEX-CLASSE > 2
      
      *Boucle itérant sur les élèves pour l'affichage s'arrêtant si
      *on dépasse le nombre max d'élèves ou si il n'y a pas d'élèves
               PERFORM VARYING WS-INDEX-ELEVE FROM 1 BY 1 
                   UNTIL WS-INDEX-ELEVE > WS-MAX-ELEVE
                   OR WS-NOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE) 
                   EQUAL SPACES
      
      *Condition vérifiant si la saisi est égal à un nom et afficher
      *le prénom si la condition est vérifiée
                   IF WS-NOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)
                       EQUAL WS-INPUT
                      DISPLAY "Prénom : "
                        WS-PRENOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)
                   END-IF    
      
               END-PERFORM
      
           END-PERFORM.     
           

           STOP RUN.     


       