       IDENTIFICATION DIVISION.
       PROGRAM-ID. insertsql.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       EXEC SQL BEGIN DECLARE SECTION END-EXEC.
       01  USER.
           05  USER-ID        PIC X(10).
           05  USER-NOM       PIC X(30).
           05  USER-PASSWORD  PIC X(30).   
       EXEC SQL END DECLARE SECTION END-EXEC.

       EXEC SQL INCLUDE SQLCA END-EXEC.
       
       LINKAGE SECTION.
       
       01  LK-USER.
           05  LK-USER-ID        PIC X(10).
           05  LK-USER-NOM       PIC X(30).
           05  LK-USER-PASSWORD  PIC X(30).

       PROCEDURE DIVISION USING LK-USER.

           MOVE LK-USER-ID TO USER-ID.
           MOVE LK-USER-NOM TO USER-NOM.
           MOVE LK-USER-PASSWORD TO USER-PASSWORD.

           EXEC SQL
                  INSERT INTO users (id_user, nom, password)
                  VALUES (:USER-ID, :USER-NOM, 
                         TRIM(:USER-PASSWORD))
           END-EXEC.

           IF SQLCODE = 0
                  DISPLAY "Insertion réussie."
           ELSE IF SQLCODE = -400
                  DISPLAY "Mot de passe trop court"
           ELSE
                  DISPLAY "Erreur d'insertion SQLCODE: " SQLCODE
           END-IF.
           
       END PROGRAM "insertsql".    
       