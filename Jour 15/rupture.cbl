       IDENTIFICATION DIVISION.
       PROGRAM-ID. rupture.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      *Alias du fichier inventaire lu ligne par ligne
       SELECT FICHIER-INVENTAIRE ASSIGN TO "inventaire.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

      *Alias du fichier rupture écris ligne par ligne
       SELECT FICHIER-RUPTURE ASSIGN TO "rupture.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       
       FILE SECTION.

      *Définition du fichier inventaire, chaque ligne contenant 
      *l'inventaire d'un article ayant un nom et un stock
       FD FICHIER-INVENTAIRE.
       01 F-INVENTAIRE.
           05 F-NOM                  PIC X(10).
           05 F-STOCK                PIC 99.

      *Définition du fichier rupture, chaque ligne contenant 
      *le nom d'un article en rupture
       FD FICHIER-RUPTURE.
       01 F-NOM-RUPTURE              PIC X(10).

       WORKING-STORAGE SECTION.
       
      *Tableau contenant l'inventaire de tous les arcticles du fichier 
       01 WS-INVENTAIRE-TAB.
           05 WS-INVENTAIRE          OCCURS 15 TIMES.
               10 WS-NOM             PIC X(10).
               10 WS-STOCK           PIC 99.

      *Variable contenant la taille maximum du tableau initialisé à 15
       77 WS-TAB-MAX                 PIC 99                VALUE 15.
      *Variable contenant l'index du tableau initialisé à 1 
       77 WS-INDEX                   PIC 99                VALUE 1.
      *Variable contenant un boolean pour savoir si la lecture du 
      *fichier est terminé 
       77 WS-FIN-FICHIER             PIC X                 VALUE 'F'.

       PROCEDURE DIVISION.
       
      *Ouverture du fichier inventaire pour la lecture 
       OPEN INPUT FICHIER-INVENTAIRE.

      *Boucle se terminant à la fin de la lecture du fichier
       PERFORM UNTIL WS-FIN-FICHIER = 'T'

      *Instruction permettant la lecture du fichier 
           READ FICHIER-INVENTAIRE

      *A la fin de la lecture on change la valeur de WS-FIN-FICHIER
               AT END
                   MOVE 'T' TO WS-FIN-FICHIER

      *A chaque ligne on associe les lignes du fichier au tableau
               NOT AT END
                   MOVE F-NOM TO WS-NOM(WS-INDEX)
                   MOVE FUNCTION NUMVAL(F-STOCK) TO WS-STOCK(WS-INDEX)
                   ADD 1 TO WS-INDEX

           END-READ

       END-PERFORM.

       CLOSE FICHIER-INVENTAIRE.
      
      *Ouverture du fichier rupture pour l'écriture
       OPEN OUTPUT FICHIER-RUPTURE.

      *Boucle pour itérer sur le tableau
       PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX > WS-TAB-MAX

      *Condition vérifiant si le stock est égal à zéro
           IF WS-STOCK(WS-INDEX) = 0

      *Si oui ajout et écriture du nom de l'article dans le fichier
               MOVE WS-NOM(WS-INDEX) TO F-NOM-RUPTURE
               WRITE F-NOM-RUPTURE

           END-IF

       END-PERFORM.

       CLOSE FICHIER-RUPTURE.

       STOP RUN.
