USE CHINOOK;
/*Esercizio 1*/
-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”

USE CHINOOK;
SELECT TRACK.NAME AS songs,GENRE.NAME AS GENERE
FROM TRACK
JOIN GENERE ON TRACK.GENEREID = GENERE.GENEREID
WHERE GENERE.NAME IN ('POP','ROCK');

 /*Esercizio 2 */
 -- Elencate tutti gli artisti e/o gli album che inizino con la lettera “A”
 
 SELECT Album.Titolo, Artist.Name
 From Album
 Right JOIN Album
 ON Album.ArtistID = Artist.ArtistID
 WHERE Album.Title like 'A%'
 OR Artist.Name like 'A%'
 AND Album.Title IS NOT NULL;
 
 /*Esercizio 3*/
 -- Elencate tutte le tracce che hanno come genere “Jazz” o che durano meno di 3 minuti
 
 SELECT TRACK.Name AS songs, Genre.Name AS Genre, Track.MilliSeconds/60000 AS durata_in_min
FROM Track
JOIN genre ON Track.GenreID = Genre.GenreID
WHERE Genre.Name IN ("JAZZ")
OR Track.MilliSeconds/60000 < 3;

/* Esercizio 4*/
-- Recuperate tutte le tracce più lunghe della durata media

SELECT Name,CONCAT(FLOOR(Milliseconds/60000),':', LPAD(FLOOR((Milliseconds % 60000)/1000),2,'0')) AS Durata
FROM Track 
WHERE Milliseconds > (SELECT AVG(Milliseconds) FROM Track);
      
/* Esercizio 5 */
-- Individuate i generi che hanno tracce con una durata media maggiore di 4 minuti
SELECT
genre.name AS GenreName
FROM Track
JOIN genre ON Track.GenreID = Genre.GenreID
Group By Genre.GenreID
HAVING AVG(Track.Milleseconds) > 24000;
      
/*Esercizio 6 */
-- Individuate gli artisti che hanno rilasciato più di un album
       
SELECT artist.Name AS ArtistName, COUNT(Album.AlbumID) AS AlbumReleased
FROM Artist
JOIN Album ON Artist.ArtistID = Album.ArtistID
GROUP BY Artist.Name
HAVING COUNT (Album.AlbumID) > 1;
       
/* Esercizio 7 */
       
-- Trovate la traccia più lunga in ogni album
SELECT 
       a.Title AS Album,
       t.Name AS track,
       t.Milliseconds/ 60000 AS DurationInMinutes
FROM
Album a
JOIN 
    Track t ON a.albumID = t.albumID
JOIN
    (SELECT AlbumID, MAX(Milliseconds) AS MaxDuration
     FROM track
     GROUP BY Album) AS MaxTrack ON t.AlbumID= Maxtrack.albumID AND T.Milliseconds = Maxtrack.MaxDuration;
     
/*Esercizio 9*/ 
-- Individuate gli album che hanno più di 20 tracce e mostrate il nome dell’album e il numero di tracce in esso contenute

SELECT 
    Album.Title, albumTitle, COUNT(Track.TrackID) n_Track
FROM
    Album
        JOIN
    Track ON Album.AlbumID = Track.AlbumID
GROUP BY Album.Title
HAVING COUNT(Track.trackID) > 20;
       
 