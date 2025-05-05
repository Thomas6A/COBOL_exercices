       IDENTIFICATION DIVISION.
       PROGRAM-ID. moyenne.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.

       01  WS-MARK-1        PIC 9(2)    VALUE 17.
       01  WS-MARK-2        PIC 9(2)    VALUE 1.
       01  WS-MARK-3        PIC 9(2)    VALUE 13.
       01  WS-MARK-4        PIC 9(2)    VALUE 11.
       01  WS-VAR           PIC 9.
       01  WS-MOY           PIC 9(2)V99.
       01  WS-MIN           PIC 9(2).
       01  WS-MAX           PIC 9(2).

       PROCEDURE DIVISION.
       
       PERFORM UNTIL WS-VAR = 4
           
           DISPLAY "Les notes sont : " WS-MARK-1" , "WS-MARK-2" , "
               WS-MARK-3 " , " WS-MARK-4
           DISPLAY "Sélectionner une option"
           DISPLAY "1- Afficher la Moyenne des Notes"
           DISPLAY "2- Afficher la Note la Plus Basse"
           DISPLAY "3- Afficher la Note la Plus Haute"
           DISPLAY "4- Quitter le programme"
           ACCEPT WS-VAR

           EVALUATE WS-VAR
               WHEN 1

                   COMPUTE WS-MOY = (WS-MARK-1 + WS-MARK-2 + WS-MARK-3
                       + WS-MARK-4)/4
                   DISPLAY "La moyenne des notes est de : " WS-MOY

               WHEN 2 

                   DISPLAY "Le minimum des notes est de : " 
                       FUNCTION MIN(WS-MARK-1,WS-MARK-2,WS-MARK-3,
                           WS-MARK-4)

               WHEN 3 

                   DISPLAY "Le maximum des notes est de : "
                       FUNCTION MAX(WS-MARK-1,WS-MARK-2,WS-MARK-3,
                           WS-MARK-4)

               WHEN 4 

                   DISPLAY "Fin du programme"

               WHEN OTHER
  
                  DISPLAY "Choix non compris"

           END-EVALUATE
           

       END-PERFORM.
       STOP RUN.
       