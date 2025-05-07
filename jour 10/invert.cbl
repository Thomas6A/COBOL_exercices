       IDENTIFICATION DIVISION.
       PROGRAM-ID. invert.
       AUTHOR. Thomas Anais.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *Variable contenant la saisi de l'utilisateur, Alphanumérique de 
      *10 charactère
       01 WS-INPUT    PIC X(10).
      *Variable contenant la saisi de l'utilisateur inversé, 
      *Alphanumérique de 10 charactère
       01 WS-INVERT   PIC X(10).

       PROCEDURE DIVISION.
       
       DISPLAY "Saisir un mot".
       ACCEPT WS-INPUT

       MOVE FUNCTION REVERSE(WS-INPUT) TO WS-INVERT
       DISPLAY WS-INVERT

       STOP RUN.
       