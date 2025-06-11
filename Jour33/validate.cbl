       IDENTIFICATION DIVISION.
       PROGRAM-ID. validate.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
       
       01 WS-COUNT        PIC 9.
       
       LINKAGE SECTION.
       
       COPY "user.cpy".

       PROCEDURE DIVISION USING USER-RECORD.

           MOVE 0 TO WS-COUNT

           INSPECT EMAIL TALLYING WS-COUNT FOR ALL "@".

           IF WS-COUNT NOT EQUAL 1
              GOBACK RETURNING 1
           ELSE IF ID-USER NOT NUMERIC
              GOBACK RETURNING 2 
           ELSE 
              GOBACK RETURNING 0 
           END-IF.

       END PROGRAM "validate".     

       

       