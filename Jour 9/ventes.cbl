      *Saisir les ventes hebdomadaires de 4 produits. Chaque produit a 
      *un nom et un prix unitaire. Afficher, pour chaque produit, le nom
      *, la quantité vendue, et le prix unitaire. Afficher la valeur 
      *total du stock. 
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ventes.
       AUTHOR. Thomas Baudrin.

       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
      *Tableau des ventes avec les produits qui ont chacun un nom, une
      *quantité et un prix 
       01 WS-VENTES.
           05 WS-PRODUITS        OCCURS 4 TIMES.
               10 WS-PRODUIT     PIC X(20).
               10 WS-QUANTITE    PIC 9(3).
               10 WS-PRIX        PIC 9(3).

      *Index du tableau WS-VENTES
       01 WS-INDEX-PRODUITS      PIC 9.
      *Variables du total
       01 WS-TOTAL-VENTES         PIC 9(6)            VALUE 0.

       PROCEDURE DIVISION.

      *Boucle permettant l'affichage d'instruction et la saisi de chaque
      *produits en itérant le tableau WS-VENTES
       PERFORM VARYING WS-INDEX-PRODUITS FROM 0 BY 1 
           UNTIL WS-INDEX-PRODUITS = 4
       
           DISPLAY "Saisissez le produit vendu"
           ACCEPT WS-PRODUIT(WS-INDEX-PRODUITS)

           DISPLAY "Saisissez la quantité vendu"
           ACCEPT WS-QUANTITE(WS-INDEX-PRODUITS)

           DISPLAY "Saisissez le prix unitaire du produits"
           ACCEPT WS-PRIX(WS-INDEX-PRODUITS)

       END-PERFORM.

      *Boucle permettant l'affichage de chaque produit ainsi que de 
      *calculer le total
       PERFORM VARYING WS-INDEX-PRODUITS FROM 1 BY 1 
           UNTIL WS-INDEX-PRODUITS > 4

           DISPLAY "Produit :"
           DISPLAY WS-PRODUIT(WS-INDEX-PRODUITS)

           DISPLAY "Quantité :"
           DISPLAY WS-QUANTITE(WS-INDEX-PRODUITS)

           DISPLAY "Prix unitaire"
           DISPLAY WS-PRIX(WS-INDEX-PRODUITS)
       
           COMPUTE WS-TOTAL-VENTES = WS-TOTAL-VENTES 
               + WS-QUANTITE(WS-INDEX-PRODUITS) 
               * WS-PRIX(WS-INDEX-PRODUITS)

       END-PERFORM.

       DISPLAY "Le total du stock est de : " WS-TOTAL-VENTES.

       STOP RUN.


