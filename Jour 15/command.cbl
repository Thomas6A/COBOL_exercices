       IDENTIFICATION DIVISION.
       PROGRAM-ID. command.
       AUTHOR. Thomas Baudrin.
       
       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      *Alias du fichier clients lu ligne par ligne
       SELECT FICHIER-CLIENTS ASSIGN TO "clients.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

      *Alias du fichier num-commandes lu ligne par ligne
       SELECT FICHIER-COMMANDES ASSIGN TO "num-commandes.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       
       FILE SECTION.

      *Définition du fichier clients ayant un client par ligne
      *possèdant chacun un id, un nom et un prénom
       FD FICHIER-CLIENTS.
       01 F-CLIENT.
           05 F-ID            PIC 99.
           05 FILLER          PIC X(6).
           05 F-NOM           PIC X(11).
           05 F-PRENOM        PIC X(11).

      *Définition du fichier commandes ayant une commande par ligne
      *possèdant chacun un id, un numéo et un prix
       FD FICHIER-COMMANDES.
       01 F-COMMANDE.
           05 F-ID-COMMANDE   PIC 99.
           05 FILLER          PIC X.
           05 F-NUMERO        PIC 9(3).
           05 FILLER          PIC X.
           05 F-PRIX          PIC 9(4).

       WORKING-STORAGE SECTION.
       
      *Tableau reprenant les données des clients et des commandes par
      *clients indexé par WS-CLIENT-INDEX
       01 WS-CLIENTS-TAB.
           05 WS-CLIENT       OCCURS 10 TIMES 
               INDEXED BY WS-CLIENT-INDEX.
               10 WS-ID       PIC 99.
               10 WS-NOM      PIC X(11).
               10 WS-PRENOM   PIC X(11).
               10 WS-COMMANDE OCCURS 3 TIMES.
                   15 WS-PRIX PIC 9(4).
       
      *Variable contenant la taille max du tableaux client initialisé à
      *10
       77 WS-CLIENT-MAX      PIC 99                    VALUE 10.
      *Variable contenant la taille max du tableaux commande initialisé
      *à 3
       77 WS-COMMANDE-MAX    PIC 9                     VALUE 3.
      *Variable correspondant à l'index du tableau commande initialisé à
      *1
       77 WS-COMMANDE-INDEX  PIC 99                    VALUE 1.
      *Variable vérifiant si le fichier client est terminé 
       77 WS-FIN-CLIENT      PIC X                     VALUE 'F'.
      *Variable vérifiant si le fichier commande est terminé 
       77 WS-FIN-COMMANDE    PIC X                     VALUE 'F'.

       PROCEDURE DIVISION.
       
      *Ouverture du fichier clients pour la lecture 
       OPEN INPUT FICHIER-CLIENTS.

      *Initialisation de la variable
       MOVE 1 TO WS-CLIENT-INDEX.

      *Boucle s'arrétant à la fin du fichier
       PERFORM UNTIL WS-FIN-CLIENT = 'T'

      *Instruction permettant de lire le fichier     
           READ FICHIER-CLIENTS

      *A la fin de la lecture on change la valeur de WS-FIN-CLIENT  
               AT END
                   MOVE 'T' TO WS-FIN-CLIENT

      *A chaque ligne on associe les valeurs du fichiers à celle du 
      *tableau         
               NOT AT END
                   MOVE F-ID TO WS-ID(WS-CLIENT-INDEX)
                   MOVE F-NOM TO WS-NOM(WS-CLIENT-INDEX)
                   MOVE F-PRENOM TO WS-PRENOM(WS-CLIENT-INDEX)
                   ADD 1 TO WS-CLIENT-INDEX

           END-READ

       END-PERFORM.

       CLOSE FICHIER-CLIENTS.

      *Ouverture du fichier commandes.
       OPEN INPUT FICHIER-COMMANDES.

      *Initialisation de la variable
       MOVE 1 TO WS-CLIENT-INDEX

      *Boucle s'arrétant à la fin du fichier
       PERFORM UNTIL WS-FIN-COMMANDE = 'T'

      *Instruction permettant de lire le fichier
           READ FICHIER-COMMANDES

      *A la fin de la lecture on change la valeur de WS-FIN-COMMANDE
               AT END
                   MOVE 'T' TO WS-FIN-COMMANDE

      *A chaque ligne on recherche une ligne du tableau qui a la meme
      *ID et si on le trouve on associe les valeurs du fichier à celles
      *du tableau
               NOT AT END
                   SEARCH WS-CLIENT VARYING WS-CLIENT-INDEX 
                   
                       WHEN WS-ID(WS-CLIENT-INDEX) = F-ID-COMMANDE
                           
                           MOVE F-PRIX 
                               TO WS-PRIX(WS-CLIENT-INDEX, F-NUMERO)

                   END-SEARCH

           END-READ

       END-PERFORM.

       CLOSE FICHIER-COMMANDES.            
       
      *Boucle itérant sur le tableau client pour l'affichage 
       PERFORM VARYING WS-CLIENT-INDEX FROM 1 BY 1 
           UNTIL WS-CLIENT-INDEX > WS-CLIENT-MAX

           DISPLAY "Client n " WS-ID(WS-CLIENT-INDEX)
           SPACE WITH NO ADVANCING
           DISPLAY " Nom : " WS-NOM(WS-CLIENT-INDEX)
           SPACE WITH NO ADVANCING
           DISPLAY " Prenom : " WS-PRENOM(WS-CLIENT-INDEX)
           DISPLAY "Commmandes : "

      *Boucle itérant sur le tableau commande de chaque client pour 
      *l'affichage 
           PERFORM VARYING WS-COMMANDE-INDEX FROM 1 BY 1
               UNTIL WS-COMMANDE-INDEX > WS-COMMANDE-MAX

               IF WS-PRIX(WS-CLIENT-INDEX, WS-COMMANDE-INDEX) > 0

                   DISPLAY "Commande numéro " WS-COMMANDE-INDEX
                   SPACE WITH NO ADVANCING
                   DISPLAY "Prix : " 
                       WS-PRIX(WS-CLIENT-INDEX, WS-COMMANDE-INDEX)

               END-IF

           END-PERFORM

       END-PERFORM.

       STOP RUN.                
       