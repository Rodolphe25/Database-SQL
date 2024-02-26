-- Esercizio 1 Identificate tutti i clienti che non hanno effettuato nessun noleggio a gennaio 2006.
SELECT DISTINCT (CUSTOMER.CUSTOMERID), CONCAT(CUSTOMER.FIRST_NAME, " ", CUSTOMER.LAST_NAME) AS CLIENTE
FROM CUSTOMER
LEFT JOIN RENTAL
USING (CUSTOMERID)
WHERE RENTAL.RENTAL_date not between "2006-01-01" AND "2006-12-31";

-- Esercizio 2 Elencate tutti i film che sono stati noleggiati più di 10 volte nell’ultimo quarto del 2005 

SELECT f.filmID, f.title, COUNT(*) AS rental_count
FROM film as f
JOIN Inventory AS I ON f.filmID = f.filmID
JOIN rental AS r ON i.InventaryID = r.InventaryID
WHERE YEAR ( r.rental_date) = 2005
AND QUARTER (r.rental_date) = 4
GROUP BY f.filmID, f.title,
HAVING 
COUNT (*) > 10;

-- Esercizio 4 Calcolate la somma degli incassi generati nei weekend (sabato e domenica).

SELECT SUM(p.amount) AS total_revenue_weekend
FROM payement AS p
JOIN rental AS r ON p.rentalID =r.rentalID
WHERE DAYOFWEEK(p.payement_date) IN (1,7);

-- Esercizio 5 Individuate il cliente che ha speso di più in noleggi.

SELECT 
c.customerID
c.first_name,
c.last_name
ORDER BY total_spent DESC
LIMIT 15;

-- Esercizio 6
SELECT f.filmID
f.title,
AVG (DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration
FROM film AS f
JOIN inventary ASi ON f.filmID = i.filmID
JOIN rental AS r ON i.inventaryID = r.inventaryID
GROUP BY avg_rental_duration DESC
LIMIT 5;


