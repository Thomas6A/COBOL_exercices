       IDENTIFICATION DIVISION.
       PROGRAM-ID. todo.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Variable WS-MENU est un entier d'un chiffre initialiser à 0 
       01  WS-MENU       PIC 9(1).
      *Les variables WS-TASK sont des alphanumériques de 100 caractères
       01  WS-TASK-1    PIC X(100).
       01  WS-TASK-2    PIC X(100).
       01  WS-TASK-3    PIC X(100).
       01  WS-TASK-4    PIC X(100).
       01  WS-TASK-5    PIC X(100).
      *Variable WS-CHOICE est un entier d'un chiffre
       01  WS-CHOICE    PIC 9(1).
      *Variables contenant phrases répétés
       01  WS-SAVE      PIC X(19)   VALUE "Tâche enregistrée".
       01  WS-DEL       PIC X(17)   VALUE "Tâche supprimée".
       01  WS-NON       PIC X(19)   VALUE "Choix non compris".


       PROCEDURE DIVISION.
    
      *Boucle permettant à l'utilisateur d'avoir un menu jusqu'au moment
      *    ou il quitte le programme
       PERFORM  UNTIL WS-MENU = 4

      *Affichage du menu à l'utilisateur et saisi de WS-MENU
           DISPLAY "Choisissez une option"
           DISPLAY "1- Ajouter une tâche"
           DISPLAY "2- Afficher les tâches"
           DISPLAY "3- Supprimer une tâche"
           DISPLAY "4- Quitter le programme"
           ACCEPT WS-MENU

      *Condition vérifiant les différents cas de WS-MENU
           EVALUATE WS-MENU

               WHEN 1
      *Appel du paragraphe 0100-CHOICE-1         
                  PERFORM 0100-CHOICE-1 THRU 0100-EXIT-CHOICE-1 

               WHEN 2             
      *Appel du paragraphe 0100-CHOICE-2                    
                  PERFORM 0100-TASKS THRU 0100-EXIT-TASKS

               WHEN 3 
      *Appel du paragraphe 0100-CHOICE-3                    
                  PERFORM 0100-CHOICE-3 THRU 0100-EXIT-CHOICE-3 
                  
               WHEN 4
                  STOP RUN

               WHEN OTHER 
                  DISPLAY WS-NON

           END-EVALUATE
           
           


       END-PERFORM.

      ******************************************************************
      *Début du paragraphe CHOICE-1 
       0100-CHOICE-1.

      *Boucle permettant d'afficher le menu tant que l'utilisateur ne
      *    quitte pas
               PERFORM UNTIL WS-CHOICE = 6

      *Affichage du menu pour l'utilisateur ainsi que la saisi de 
      *    WS-CHOICE
                  DISPLAY "Choisissez quelle tâche ajoutée"
                  PERFORM 0100-TASKS THRU 0100-EXIT-TASKS
                  DISPLAY "6- Retour"
                  ACCEPT WS-CHOICE

      *Condition vérifiant chaque cas de WS-CHOICE et la saisi de 
      *    l'utilisateur pour la task correspondante
                  EVALUATE WS-CHOICE
                     WHEN 1

                        DISPLAY "Entrez la tâche 1"
                        ACCEPT WS-TASK-1
                        DISPLAY WS-SAVE
                        
                     WHEN 2

                        DISPLAY "Entrez la tâche 2"
                        ACCEPT WS-TASK-2
                        DISPLAY WS-SAVE

                     WHEN 3
                      
                        DISPLAY "Entrez la tâche 3"
                        ACCEPT WS-TASK-3
                        DISPLAY WS-SAVE

                     WHEN 4
                      
                        DISPLAY "Entrez la tâche 4"
                        ACCEPT WS-TASK-4
                        DISPLAY WS-SAVE

                     WHEN 5
                      
                        DISPLAY "Entrez la tâche 5"
                        ACCEPT WS-TASK-5
                        DISPLAY WS-SAVE

                     WHEN 6 
                        
                        DISPLAY "Retour"
                        
                     WHEN OTHER
                        DISPLAY WS-NON
                  END-EVALUATE

               END-PERFORM

      *Appel du paragraphe 0100-RESET-WS-CHOICE 
               PERFORM 0100-RESET-WS-CHOICE 
                  THRU 0100-EXIT-RESET-WS-CHOICE

       .

      *Fin du paragraphe CHOICE-1
       0100-EXIT-CHOICE-1.
           EXIT
       .
       
      *Début du paragraphe TASKS affichant un menu pour l'utilisateur
       0100-TASKS.
           DISPLAY "1- " WS-TASK-1
           DISPLAY "2- " WS-TASK-2
           DISPLAY "3- " WS-TASK-3
           DISPLAY "4- " WS-TASK-4
           DISPLAY "5- " WS-TASK-5
       .

      *Fin du paragraphe TASKS
       0100-EXIT-TASKS.
           EXIT
       .

      *Début du paragraphe CHOICE-3
       0100-CHOICE-3. 

      *Boucle permettant d'afficher le menu tant que l'utilisateur ne
      *    quitte pas
           PERFORM UNTIL WS-CHOICE = 6

      *Affichage du menu pour l'utilisateur ainsi que la saisi de 
      *    WS-CHOICE
              DISPLAY "Choisissez quelle tâche supprimée"
              PERFORM 0100-TASKS THRU 0100-EXIT-TASKS
              DISPLAY "6- Retour"
              ACCEPT WS-CHOICE

      *Condition vérifiant chaque cas de WS-CHOICE et la suppression de 
      *    la task correspondante
              EVALUATE WS-CHOICE
                 WHEN 1

                    MOVE SPACES TO WS-TASK-1
                    DISPLAY WS-DEL
                        
                 WHEN 2

                    MOVE SPACES TO WS-TASK-2
                    DISPLAY WS-DEL

                 WHEN 3
                      
                    MOVE SPACES TO WS-TASK-3
                    DISPLAY WS-DEL

                 WHEN 4
                      
                    MOVE SPACES TO WS-TASK-4
                    DISPLAY WS-DEL

                 WHEN 5
                      
                    MOVE SPACES TO WS-TASK-5
                    DISPLAY WS-DEL

                 WHEN 6
                    
                    DISPLAY "Retour"
                        
                 WHEN OTHER
                    DISPLAY WS-NON
              END-EVALUATE

           END-PERFORM

      *Appel du paragraphe 0100-RESET-WS-CHOICE 
           PERFORM 0100-RESET-WS-CHOICE 
              THRU 0100-EXIT-RESET-WS-CHOICE

       .

      *Fin du paragraphe
       0100-EXIT-CHOICE-3.
           EXIT
       .

      *Début du paragraphe permettant de remettre la variable WS-CHOICE 
      *    à 0
       0100-RESET-WS-CHOICE.
           MOVE 0 TO WS-CHOICE
       .

      *Fin du paragraphe
       0100-EXIT-RESET-WS-CHOICE.
           EXIT
       .
