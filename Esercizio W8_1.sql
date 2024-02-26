-- Esercizio 2 Scoprite quanti clienti si sono registrati nel 2006.
SELECT COUNT(*) AS conteggio
FROM Customer 
WHERE Year (creat_date) = 2006;

-- Esercizio 3 Trovate il numero totale di noleggi effettuati il giorno 1/1/2006.

SELECT distinct count(*)
FROM rental right
WHERE rental_date like'%2006-1-1%';

-- Esercizio 4 Elencate tutti i film noleggiati nell’ultima settimana e
 -- tutte le informazioni legate al cliente che li ha noleggiate
 
SELECT FILM.TITLE AS NOME_FILM, CONCAT(Customer_First_Name, Customer_Last_Name) AS Nome_Cognome
FROM RENTAL
JOIN INVENTORY ON Rental.InventoryID = Inventory.InventoryID
JOIN Film ON Inventory.FilmID = Film.FilmID
JOIN Customer ON  Customer.CustomerID = Rental.CustomerID
WHERE 
     r.rental_date >= ( SELECT DATE_SUB(MAX(rental_date), INTERNAL  1 WEEK) FROM rental);
     
     
-- Esercizio 5 Calcolate la durata media del noleggio per ogni categoria di film.

SELECT AVG(DATEDIFF(Return_date, rental_date)) duraramedianoleggio,
category.name genere
FROM RENTAL
JOIN Inventory USING (InventoryID)
JOIN Film_Category USING (FilmID)
JOIN Category USING (CategoryID)
GROUP BY CategoryID
SELECT DISTINCT CategoryID FROM Film_Category;

-- Esercizio 6 Trovare la durata del noleggio piu lungo

SELECT * FROM rental
ORDER BY DATEDIFF(return_date, rental_date) DESC
LIMIT 1;