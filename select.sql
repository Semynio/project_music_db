-- Задание 2

SELECT title, duration
FROM Tracks
ORDER BY duration DESC
LIMIT 1;

SELECT title
FROM Tracks
WHERE duration >= 3.5;

SELECT title
FROM Compilations
WHERE year BETWEEN 2018 AND 2020;

SELECT name
FROM Artists
WHERE name NOT LIKE '% %';

SELECT title
FROM Tracks
WHERE LOWER(title) LIKE '%мой%' OR LOWER(title) LIKE '%my%';

-- Задание 3

SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM Genres g
LEFT JOIN ArtistGenres ag ON g.genre_id = ag.genre_id
GROUP BY g.name;

SELECT COUNT(t.track_id) AS tracks_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.album_id
WHERE a.year BETWEEN 2019 AND 2020;

SELECT a.title, AVG(t.duration) AS avg_duration
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.title;

SELECT name
FROM Artists
WHERE artist_id NOT IN (
  SELECT DISTINCT artist_id
  FROM ArtistAlbums aa
  JOIN Albums a ON aa.album_id = a.album_id
  WHERE a.year = 2020
);

SELECT DISTINCT c.title
FROM Compilations c
JOIN CompilationTracks ct ON c.compilation_id = ct.compilation_id
JOIN Tracks t ON ct.track_id = t.track_id
JOIN Albums a ON t.album_id = a.album_id
JOIN ArtistAlbums aa ON a.album_id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.artist_id
WHERE ar.name = 'Моцарт';

-- Задание 4 

SELECT DISTINCT a.title
FROM Albums a
JOIN ArtistAlbums aa ON a.album_id = aa.album_id
JOIN (
  SELECT artist_id
  FROM ArtistGenres
  GROUP BY artist_id
  HAVING COUNT(genre_id) > 1
) multi_genre_artists ON aa.artist_id = multi_genre_artists.artist_id;

SELECT title
FROM Tracks
WHERE track_id NOT IN (
  SELECT track_id FROM CompilationTracks
);

SELECT ar.name
FROM Artists ar
JOIN ArtistAlbums aa ON ar.artist_id = aa.artist_id
JOIN Tracks t ON aa.album_id = t.album_id
WHERE t.duration = (
  SELECT MIN(duration) FROM Tracks
);

SELECT a.title
FROM Albums a
JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_id, a.title
HAVING COUNT(t.track_id) = (
  SELECT MIN(track_count) FROM (
    SELECT COUNT(track_id) AS track_count
    FROM Tracks
    GROUP BY album_id
  ) AS counts
);
