       IDENTIFICATION DIVISION.
       PROGRAM-ID. romains.
       AUTHOR. Thomas Baudrin.

       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
       01 WS-INPUT    PIC 9(4).
       01 WS-RESULT   PIC X(9).


       PROCEDURE DIVISION.

       DISPLAY "Saisir un nombre inférieur à 3999".
       ACCEPT WS-INPUT.

       PERFORM UNTIL WS-INPUT = 0

           EVALUATE WS-INPUT
               WHEN >= 1000 
                  SUBTRACT 1000 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"M") TO WS-RESULT
               WHEN >= 900
                  SUBTRACT 900 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"CM") TO WS-RESULT 
               WHEN >= 500
                  SUBTRACT 500 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"D") TO WS-RESULT    
               WHEN >= 400
                  SUBTRACT 400 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"CD") TO WS-RESULT  
               WHEN >= 100
                  SUBTRACT 100 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"C") TO WS-RESULT    
               WHEN >= 90
                  SUBTRACT 90 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"XC") TO WS-RESULT   
               WHEN >= 50
                  SUBTRACT 50 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"L") TO WS-RESULT  
               WHEN >= 40
                  SUBTRACT 40 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"XL") TO WS-RESULT
               WHEN >= 10
                  SUBTRACT 10 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"X") TO WS-RESULT  
               WHEN >= 9
                  SUBTRACT 9 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"IX") TO WS-RESULT  
               WHEN >= 5
                  SUBTRACT 5 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"V") TO WS-RESULT
               WHEN >= 4
                  SUBTRACT 4 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"IV") TO WS-RESULT 
               WHEN >= 1
                  SUBTRACT 1 FROM WS-INPUT GIVING WS-INPUT
                  MOVE FUNCTION CONCATENATE(
                    FUNCTION TRIM(WS-RESULT);"I") TO WS-RESULT                                                        
               WHEN OTHER
                  CONTINUE
           END-EVALUATE
           

       END-PERFORM.

       DISPLAY WS-RESULT.

       STOP RUN.
       

       