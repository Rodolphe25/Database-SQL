USE videogamestoredb;
SELECT * FROM impiegato
SELECT * FROM impiegato WHERE TitoloStudio = "Laurea in Economia";
SELECT 
    NOME
FROM
    impiegato
WHERE
    TitoloStudio = "Laurea in Economia";
SELECT* FROM servizio_impiegato
SELECT * FROM servizio_impiegato WHERE Carica = "cassiere";
SELECT 
    *
FROM
    impiegato
WHERE
    TitoloStudio = "Laurea di Informatica";

SELECT 
    *
FROM
    impiegato
        LEFT JOIN
    servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
WHERE
    servizio_impiegato.Carica = "cassiere"
        OR impiegato.TitoloStudio = "Diploma di Informatica";
        
        SELECT 
    Nome, TitoloStudio
FROM
    impiegato
        LEFT JOIN
    servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
    WHERE servizio_impiegato.DataInizio > '2023-01-01' ;
    
    -- Seleziona i titoli di studio distinti tra gli impiegati
    SELECT DISTINCT TitoloStudio FROM IMPIEGATO;
    
    -- Seleziona gli impiegati con un titolo di studio diverso da "Laurea in Economia".
    SELECT * FROM IMPIEGATO WHERE TitoloStudio <> '%economia';
    
    -- Seleziona gli impiegati che hanno iniziato a lavorare prima del 1 luglio 2023 e sono Commessi
    SELECT 
    *
FROM
    impiegato
        JOIN
    servizio_impiegato ON impiegato.CodiceFiscale = servizio_impiegato.CodiceFiscale
    WHERE servizio_impiegato.DataInizio < '2023-07-01'
    AND servizio_impiegato.Carica = ' commessa ';
    
    
    
    -- Seleziona i titoli e gli sviluppatori dei videogiochi distribuiti nel 2020
   
    SELECT * FROM videogioco;
    SELECT Titolo, svillupatore FROM videogioco 
    WHERE year (annoDisribuzione) = '2020';
    
    $$$$$
    
    
    