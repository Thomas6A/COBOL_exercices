       IDENTIFICATION DIVISION.
       PROGRAM-ID. lirepers.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

      *Variable FICHIER-PERSONNES assigner au fichier personnes.txt
      *Fichier lu ligne par ligne
       SELECT FICHIER-PERSONNES ASSIGN TO "personnes.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       
       FILE SECTION.

      *Définition du fichier
      *Chaque ligne représente une personne chacun ayant un nom, 
      *un prénom et une date de naissance
       FD FICHIER-PERSONNES.
       01 F-PERSONNE.
           05 F-NOM            PIC X(15).
           05 F-PRENOM         PIC X(15).
           05 F-NAISSANCE.    
               10 F-MOIS       PIC 99.
               10 F-JOUR       PIC 99.
               10 F-ANNEE      PIC 9(4).

       WORKING-STORAGE SECTION.

      *Tableau stockant les différentes données du fichier indexé par
      *WS-INDEX
       01 WS-PERSONNES-TABLE.
           05 WS-PERSONNE      OCCURS 10 TIMES   INDEXED BY WS-INDEX.
               10 WS-NOM       PIC X(15).
               10 WS-PRENOM    PIC X(15).
               10 WS-NAISSANCE.
                   15 WS-JOUR  PIC 99.
                   15 WS-MOIS  PIC 99.
                   15 WS-ANNEE PIC 9(4).

      *Ligne permettant l'affichage structuré des données
       01 WS-LINE.
           05 FILLER           PIC X(6)          VALUE "Nom : ".
           05 WS-NOM-LINE      PIC X(15).  
           05 FILLER           PIC X(10)         VALUE " Prenom : ".
           05 WS-PRENOM-LINE   PIC X(15). 
           05 FILLER           PIC X(21)         
                               VALUE " Date de naissance : ".
           05 WS-JOUR-LINE     PIC X(2). 
           05 FILLER           PIC X             VALUE '/'.
           05 WS-MOIS-LINE     PIC X(2).
           05 FILLER           PIC X             VALUE '/'.
           05 WS-ANNEE-LINE    PIC X(4).


      *Variable contenant la taille du fichier initialiser à 10 
       77 WS-MAX-FICHIER       PIC 99            VALUE 10.
      *Boolean permettant de vérifier si on a fini de lire le fichier 
       77 WS-FIN-FICHIER       PIC X             VALUE 'N'.
      *Variable contenant la saisi de l'utilisateur 
       77 WS-INPUT             PIC X(15).

      *Groupe de variable contenant la date actuelle
       01 WS-CURRENT-DATE.
           05 WS-CURRENT-YEAR  PIC 9(4).
           05 WS-CURRENT-MONTH PIC 99.
           05 WS-CURRENT-DAY   PIC 99.

      *Variable permettant de contenir l'age de la personne
       77 WS-AGE               PIC 99.

       PROCEDURE DIVISION.
       
      *Initialisation de l'index à 1 
       MOVE 1 TO WS-INDEX.

      *Ouverture du fichier
       OPEN INPUT FICHIER-PERSONNES.

      *Boucle permettant de lire tout le fichier jusqu'à ce qu'on arrive
      * à la fin
       PERFORM UNTIL WS-FIN-FICHIER = 'Y'

      *Instruction permettant de lire le fichier
           READ FICHIER-PERSONNES

      *Ajout de Y dans le boolean à la fin du fichier, permettant de
      *quitter la boucle
               AT END MOVE 'Y' TO WS-FIN-FICHIER
      *Sinon ajout de chaque élément de la ligne dans le fichier         
               NOT AT END
                   MOVE F-NOM TO WS-NOM(WS-INDEX)
                   MOVE F-PRENOM TO WS-PRENOM(WS-INDEX)
                   MOVE F-JOUR TO WS-JOUR(WS-INDEX)
                   MOVE F-MOIS TO WS-MOIS(WS-INDEX)
                   MOVE F-ANNEE TO WS-ANNEE(WS-INDEX)
                   ADD 1 TO WS-INDEX
               
           END-READ

       END-PERFORM.

      *Fermeture du fichier
       CLOSE FICHIER-PERSONNES.

      *Boucle permettant l'affichage du tableau
       PERFORM VARYING WS-INDEX FROM 1 BY 1 
           UNTIL WS-INDEX > WS-MAX-FICHIER
           
      *Appel du paragraphe permettant l'affichage d'une ligne     
           PERFORM 0100-AFFICHAGE THRU 0100-AFFICHAGE-END

       END-PERFORM. 

      *Réinitialisation de WS-INDEX
       MOVE 1 TO WS-INDEX.

      *Affichage de l'instruction et saisi de l'utilisateur
       DISPLAY "Saisir un nom"
       ACCEPT WS-INPUT.

      *Instruction permettant la recherche dans le tableau
      *Si rien est trouvé affichage d'un message
       SEARCH WS-PERSONNE VARYING WS-INDEX
           AT END DISPLAY "Individu non trouvé"

      *Arret dès que l'un des noms correpond à l'input
           WHEN WS-NOM(WS-INDEX) = WS-INPUT

      *Appel du paragraphe permettant l'affichage d'une ligne 
               PERFORM 0100-AFFICHAGE THRU 0100-AFFICHAGE-END

      *Ajout de la date actuelle dans WS-CURRENT-DATE
               MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE

      *Soustraction de l'année de naissance à l'année actuelle, nous 
      *donnat l'age         
               SUBTRACT WS-ANNEE(WS-INDEX) FROM WS-CURRENT-YEAR 
                   GIVING WS-AGE

      *Condition vérifiant si le mois actulle est inférieur au mois de
      *naissance ou si le jour actuelle est inférieur au jour de 
      *naissance si le mois est identique
               IF WS-CURRENT-MONTH < WS-MOIS(WS-INDEX) 
                   OR (WS-CURRENT-MONTH = WS-MOIS(WS-INDEX)
                   AND WS-CURRENT-DAY < WS-JOUR(WS-INDEX))

      *Soustraction de 1 dans l'age si vrai
                   SUBTRACT 1 FROM WS-AGE GIVING WS-AGE    

               END-IF

      *Affichade de l'age
               DISPLAY "Son age est de " WS-AGE " ans"

       END-SEARCH.

       STOP RUN.   
       
      ****************************************************************** 

      *Paragraphe permettant l'association des variables de tableaux à 
      *celles d'affichages et efin permettre de les afficher
       0100-AFFICHAGE.

           MOVE WS-NOM(WS-INDEX) TO WS-NOM-LINE
           MOVE WS-PRENOM(WS-INDEX) TO WS-PRENOM-LINE
           MOVE WS-JOUR(WS-INDEX) TO WS-JOUR-LINE
           MOVE WS-MOIS(WS-INDEX) TO WS-MOIS-LINE
           MOVE WS-ANNEE(WS-INDEX) TO WS-ANNEE-LINE

           DISPLAY WS-LINE
       .

      *Fin du paragraphe
       0100-AFFICHAGE-END.
           EXIT 
       .

       