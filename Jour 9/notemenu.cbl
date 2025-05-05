      *Programme COBOL qui permet : De saisir un ensemble de
      * notes (stockées dans un tableau). De naviguer dans un menu pour 
      *: Saisir les 10 notes Afficher la moyenne des notes Afficher la 
      *note la plus basse Afficher la note la plus haute Quitter le 
      *programme Les notes sont comprise entre 0 et 20. La moyenne 
      *d'une note s'affiche sous format: 99V99 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. notemenu.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Tableau de 10 notes qui sont chacun des entiers de 2 chiffres 
       01 WS-NOTES.
           05 WS-NOTE        PIC 99        OCCURS 10 TIMES.
       
      *Variable correspondant à la moyenne des note
       01 WS-MOYENNES        PIC 99V99.
      *Variable correspondant à la somme des notes permettant le calcul
      *de la moyenne
       01 WS-SOMMES          PIC 9(3)      VALUE 0.
      *Variables correspondant au minimum et maximum des notes
       01 WS-MIN             PIC 99        VALUE 20.
       01 WS-MAX             PIC 99        VALUE 0.
      *Variable pour l'index du tableau note
       01 WS-INDEX-NOTES     PIC 99.
      *Variable pour la saisi de l'utilisateur
       01 WS-INPUT           PIC 9.
       
       PROCEDURE DIVISION.
       
      *Boucle permettant l'affichage du menu en permanence jusqu'à la
      *saisie de 5
       PERFORM UNTIL WS-INPUT = 5

      *Menu et saisi de l'utilisateur
           DISPLAY "1- Saisir les 10 notes"
           DISPLAY "2- Afficher la moyennes"
           DISPLAY "3- Afficher la note la plus basse"
           DISPLAY "4- Afficher la note la plus haute"
           DISPLAY "5- Quitter le programme"
           ACCEPT WS-INPUT

      *Condition vérifiant la saisi de l'utilisateur
           EVALUATE WS-INPUT

      *Si l'utilisateur saisi 1 il saisi alors les 10 notes
               WHEN 1

      *Réinitialisation de la variable WS-SOMMES
                  WS-SOMMES = 0
                  
      *Boucle permettant d'itérer le tableau WS-NOTES
                  PERFORM VARYING WS-INDEX-NOTES FROM 1 BY 1 
                      UNTIL WS-INDEX-NOTES > 10

      *Affichage d'instruction et saisi de la note
                      DISPLAY "Saisir notes " WS-INDEX-NOTES
                      ACCEPT WS-NOTE(WS-INDEX-NOTES)

      *Condition vérifiant si il est plus grand que WS-MAX et l'associe
      *si c'est le cas
                      IF WS-NOTE(WS-INDEX-NOTES) > WS-MAX
                          
                          MOVE WS-NOTE(WS-INDEX-NOTES) TO WS-MAX

                      END-IF

      *Condition vérifiant si il est plus grand que WS-MAX et l'associe
      *si c'est le cas
                      IF WS-NOTE(WS-INDEX-NOTES) < WS-MIN
                          
                          MOVE WS-NOTE(WS-INDEX-NOTES) TO WS-MIN

                      END-IF

      *Calcul permettant d'ajouter la note à la somme des notes
                      ADD WS-NOTE(WS-INDEX-NOTES) TO WS-SOMMES

                  END-PERFORM

      *Si l'utilisateur saisi 2 on calcule la moyenne et l'affiche
               WHEN 2 

                  COMPUTE WS-MOYENNES = WS-SOMMES / 10
                  DISPLAY "Moyennes : " WS-MOYENNES

      *Si l'utilisateur saisi 3 on affiche la note minimum
               WHEN 3
                  
                  DISPLAY "La note la plus baisse : " WS-MIN

      *Si l'utilisateur fait 4 on affiche la note maximum
               WHEN 4 

                  DISPLAY "La note la plus élevé : " WS-MAX

      *Si l'utilisateur saisi 5 on quitte le programme
               WHEN 5 
                  
                  DISPLAY "Fin du programme"

      *Si l'utilisateur saisi autre chose on envoie un message d'erreur
               WHEN OTHER

                  DISPLAY "Erreur de saisi"

           END-EVALUATE
           
           

       END-PERFORM.

       STOP RUN.
