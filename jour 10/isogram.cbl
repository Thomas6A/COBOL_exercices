       IDENTIFICATION DIVISION.
       PROGRAM-ID. isogram.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Variable saisi par l'utilisateur, alphanumérique de 10 caractères
       01 WS-WORD          PIC X(10).
      *Variable index permettant d'itérer un première fois, entier de 2
      *chiffres 
       01 WS-INDEX         PIC 99.
      *Variable index permettant d'itérer une deuxième fois, entier de 2
      *chiffres  
       01 WS-INDEX-2       PIC 99.
      *Variable permettant de savoir si c'est un isogramme, ne sera que 
      *1 ou 0 
       01 WS-ISOGRAM       PIC 9     VALUE 1.

       PROCEDURE DIVISION.
       
      *Affichage de l'instruction et saisi de l'utilisateur 
       DISPLAY "Entrez votre mot".
       ACCEPT WS-WORD.

      *Boucle s'arrètant quand le mot n'est pas un isogramme ou quand
      *l'index est égal à 10
       PERFORM VARYING WS-INDEX FROM 1 BY 1 UNTIL WS-INDEX = 10 
           OR WS-ISOGRAM = 0

      *Boucle s'arrètant quand le mot n'est pas un isogramme ou quand
      *l'index 2 est égal à 11
           PERFORM VARYING WS-INDEX-2 FROM WS-INDEX BY 1 
               UNTIL WS-INDEX-2 = 11 OR WS-ISOGRAM = 0

      *Condition vérifiant que les index ne sont pas au même endroit et
      *que la lettre soit la même et qu'il ne soit pas un espace
               IF WS-INDEX NOT EQUAL WS-INDEX-2 
                   AND WS-WORD(WS-INDEX:1) = WS-WORD(WS-INDEX-2:1) 
                   AND WS-WORD(WS-INDEX:1) NOT EQUAL SPACE

      *Si oui on associe 0 à WS-ISOGRAM
                   MOVE 0 TO WS-ISOGRAM

               END-IF 
           
           END-PERFORM

       END-PERFORM.

      *Condition affichant si oui ou non le mot est un isogramme selon
      *si WS-ISOGRAM est égal à 0 ou 1
       IF WS-ISOGRAM = 1
           
           DISPLAY "C'est un isogramme"

       ELSE 

           DISPLAY "Ce n'est pas un isogramme"
          
       END-IF.

       STOP RUN.
       