
/* Esercizio 1 */
-- Elencate il numero di tracce per ogni genere in ordine discendente, escludendo quei generi che hanno meno di 10 tracce
SELECT genreID GenreTrack, COUNT(*) AS countTrack
FROM Track
Group BY genreID
HAVING CountTrack >= 10;

SELECT g.Name, COUNT(g.Name) AS numeroTracce
FROM genre g
JOIN Track t ON g.GenreID = t.GenreID
Group by g.Name
HAVING COUNT(g.Name) >=10
Order by NumeroTracce DESC;

/*Esercizio 2 */
-- Trovate le tre canzoni più costose

SELECT Track.Name namet, Track.unitprice maxprice
FROM Track
ORDER BY maxprice DESC
LIMIT 3;

/*Esercizio 3 */
-- Elencate gli artisti che hanno canzoni più lunghe di 6 minuti.

SELECT Artist.Name AS Artist_Name FROM Artist
JOIN Album ON Artist.ArtistID = Album.ArtistID
JOIN Track ON Track.AlbumID = Album.AlbumID
WHERE track.name IN (
SELECT track.Name AS Track_Name FROM Track
WHERE Track.Milliseconds> 360000)
GROUP BY Artist_name;

/* Esercizio 4 */
-- Individuate la durata media delle tracce per ogni genere

SELECT Genre.Name AS Genre, FLOOR(AVG(Track.Milleseconds/60000)) AS MINUTES, ROUND(AVG(Track.Milleseconds/60000))-FLOOR(AVG(Track.Milleseconds/60000)))*60) AS SECONDS
FROM Genre
JOIN Track ON Track.GenreID = Genre.GenreID
GROUP BY Genre.Name
HAVING FLOOR (AVG(Track.Milleseconds/60000));

/*Esercizio 5 */
-- Elencate tutte le canzoni con la parola “Love” nel titolo, ordinandole alfabeticamente prima per genere e poi per nome

SELECT Name FROM Track
JOIN Genre ON track.GenreID = Genre.GenreID
WHERE Track.Name LIKE '%LOVE%'
ORDER BY genre.Name, Track.Name;

/* Esercizio 6*/
-- Trovate il costo medio per ogni tipologia di media
SELECT 
MediaType.Name moment, AVG(Track.UnitPrice) media
FROM
Mediatype
JOIN Track ON Mediatype.MediatypeID = Track.MediatypeID
GROUP BY moment;

/*Esercizio 7*/ 
-- Individuate il genere con più tracce

SELECT Genere.name Nomegenre, COUNT(track.name) numero
FROM Genre
JOIN Track ON Track.GenreID = Genre.GenreID
GROUP BY Genre.Nome
ORDER BY Numero DESC
LIMIT 1;


