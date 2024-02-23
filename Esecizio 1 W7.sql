/* Esercizio 1*/
USE chinook;

SHOW TABLES ;
-- Visualizzate le prime 10 righe della tabella Album
SELECT * FROM ALBUM
SELECT*
FROM ALBUM 
LIMIT 10

/*Esercizio 2 */
-- Trovate il numero totale di canzoni della tabella Tracks

SELECT COUNT(DISTINCT NAME)
FROM track;

/* Esercizio 3 */
-- Trovate i diversi generi presenti nella tabella Genre

SELECT DISTINCT NAME FROM genre

SELECT TRACK.NAME AS TrackName, Genre.NAME AS GenreName FROM Track
LEFT JOIN Genre ON Track.GenreID = GenreID
ORDER BY Genre.Name; 


-- Recuperate il nome di tutte le tracce e del genere associato

-- Recuperate il nome di tutti gli artisti che hanno almeno un album nel database. Esistono artisti senza album nel database?
SELECT DISTINCT 'artist' .NAME
FROM 'artist'
JOIN 'album' ON 'artist' .artistid = album.artistID;

/*Esercizio 4*/
-- Recuperate il nome di tutte le tracce, del genere associato e della tipologia di media. Esiste un modo per recuperare il nome della tipologia di media?

SELECT Track.Name AS TrackName, Genre.Name AS GenreName, MediaType.MediaName AS MediaName COUNT (*)
FROM Track 
INNER JOIN genre ON Track.GenreID = Genre.GenreID
INNER JOIN mediatype ON Track.MediaTypeID = MediaType.MediaTypeID;
Group by Track.Name, Genre.Name, MediaType.Name;

SELECT g Name COUNT  (*) FROM genre g
INNER Track t ON 
g GenreID = t GenreID
INNER JOIN MediaType in ON
t.MediaTypeID = n.MediaTypeID
GROUP BY g.Name;

/*Esercizio 5*/

-- Elencate i nomi di tutti gli artisti e dei loro album

SELECT ARTIST.Name AS Artist_Name, Album.Titolo AS Album_Name FROM Artist
LEFT JOIN Album ON Artist.ArtistID = Album.ArtistID
ORDER BY ArtistID;

/* Esercizio 6*/
-- Recuperate tutte le tracce che abbiano come genere “Pop” o “Rock”

SELECT Album.Title AS AlbumTitle, AVG (Track.Milleseconds)/1000 AS Avg.track FROM Album
JOIN Track ON Album.AlbumID = Track.AlbumID
Group by Album.AlbumID;

