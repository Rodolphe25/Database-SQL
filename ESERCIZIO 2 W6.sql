-- Seleziona tutti i prodotti con un prezzo superiore a 50 euro dalla tabella Prodotti
SELECT * FROM Produtti
WHERE Prezzo > '50';

-- Seleziona tutte le email dei clienti il cui nome inizia con la lettera 'A' dalla tabella Clienti

SELECT Email  FROM Clienti
WHERE Name = 'A%';

-- Seleziona tutti gli ordini con una quantità maggiore di 10 o con un importo totale inferiore a 100 euro dalla tabella Ordini

SELECT * FROM Ordini
JOIN DettaglioOrdini ON Ordini.IDOrdini = Produtti.IDOrdini
WHERE Ordini.Quantità > 10
AND DettaglioOrdini.PrezzoTotale < 100;

SELECT * FROM DettaglioOrdini;
INSERT INTO DettaglioOrdini ( IDordine, IDProdutti, IDClienti, PrezzoTotale)
ord.IDClient
ord.IDProdotti
ord.IDordine
o.Quantità * p.Prezzo AS PrezzoTotale
FROM DettaglioOrdine d
JOIN Ordini o ON d.IDOrdine = o.IDOrdine
JOIN Prodotti p ON d.IDProdotto = p.IDProdotto
-- Seleziona tutti i prezzi dei prodotti il cui nome contiene la parola 'tech' indipendentemente dalla posizione nella tabella Prodotti
SELECT Prezzo FROM Prodotto
WHERE NomeProdotto LIKE '%tech%';

-- Seleziona tutti i clienti che non hanno un indirizzo email nella tabella Clienti
SELECT * FROM Clienti
WHERE Email IS NULL;

-- Seleziona tutti i prodotti il cui nome inizia con 'M' e termina con 'e' indipendentemente dalla lunghezza della parola nella tabella Prodotti
SELECT * FROM Prodotti
WHERE NomeProdotto like 'M%e';