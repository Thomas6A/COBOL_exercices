       IDENTIFICATION DIVISION.
       PROGRAM-ID. main_sql.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       COPY "user.cpy".
       01  USERNAME           PIC X(30) VALUE "postgres".
       01  PASSWD             PIC X(30) VALUE "cbl85".
       01  DBNAME             PIC X(10) VALUE "db_user".
       EXEC SQL END DECLARE SECTION END-EXEC.

       EXEC SQL INCLUDE SQLCA END-EXEC.

       PROCEDURE DIVISION.

           DISPLAY "Connexion à la base de données...".
           EXEC SQL
                CONNECT :USERNAME IDENTIFIED BY :PASSWD USING :DBNAME
           END-EXEC.
           IF SQLCODE NOT = 0
               DISPLAY "Erreur de connexion SQLCODE: " SQLCODE
               STOP RUN
           END-IF.
      
           DISPLAY "Entrez l'ID de l'utilisateur: ".
           ACCEPT USER-ID.
           DISPLAY "Entrez le nom de l'utilisateur : ".
           ACCEPT USER-NOM.
           DISPLAY "Entrez le mot de passe de l'utilisateur: ".
           ACCEPT USER-PASSWORD.
      
           CALL "insertsql" USING USER.
           
           EXEC SQL COMMIT END-EXEC.
       STOP RUN.
