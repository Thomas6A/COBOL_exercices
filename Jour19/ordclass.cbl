      *Saisir un tableau multidimensionnel de noms et prénoms d'élèves 
      *dans deux classes (CM1 et CM2) depuis le terminal, trier les 
      *élèves par ordre alphabétique, puis enregistrer les données 
      *triées dans un fichier texte. 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ordclass.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      *Alias du fichier classes-sortie ecris ligne par ligne
       SELECT FICHIER-CLASSES ASSIGN TO "classes-sortie.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

      *Définition du fichier, chaque ligne ayant un élève ayant une
      *classe, un prénom et un nom
       FD FICHIER-CLASSES.
       01 F-ELEVES.
           05 F-CLASSE            PIC X(4).
           05 F-NOM               PIC X(15).
           05 F-PRENOM            PIC X(15).

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

      *Instruction permettant de classer par ordre alphabetique les 
      *élèves
               SORT WS-ELEVE(WS-INDEX-CLASSE) ASCENDING
      
           END-PERFORM.

      *Ouverture du fichier
           OPEN OUTPUT FICHIER-CLASSES.
           
      *Boucle itérant sur les classes pour l'écriture
           PERFORM VARYING WS-INDEX-CLASSE FROM 1 BY 1 
               UNTIL WS-INDEX-CLASSE > 2
      
      *Boucle itérant sur les élèves pour l'écriture
               PERFORM VARYING WS-INDEX-ELEVE FROM 1 BY 1 
                   UNTIL WS-INDEX-ELEVE > 6
      
      *Condition vérifiant l'index afin d'associer la classe 
      *correspondante
                   IF WS-INDEX-CLASSE = 1
                       MOVE "CM1" TO F-CLASSE
                   ELSE 
                       MOVE "CM2" TO F-CLASSE
                   END-IF
      *Instruction permettant d'associer les données du tableau au 
      *fichier             
                   MOVE WS-NOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)
                       TO F-NOM
                   MOVE WS-PRENOM-ELEVE(WS-INDEX-CLASSE,WS-INDEX-ELEVE)
                       TO F-PRENOM 

      *Ecriture de la ligne dans le tableau
                   WRITE F-ELEVES   
      
               END-PERFORM
      
           END-PERFORM.

      *Fermeture du fichier
           CLOSE FICHIER-CLASSES.

           STOP RUN.         
       