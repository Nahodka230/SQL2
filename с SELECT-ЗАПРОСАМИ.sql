SELECT name, duration FROM track 
WHERE duration = (SELECT MAX(duration) FROM track);

SELECT name FROM track
WHERE duration >=210;

SELECT name FROM collection c 
WHERE prod_year BETWEEN  2018 AND 2020;

SELECT name FROM singer 
WHERE name NOT LIKE '% %';

SELECT name FROM track 
WHERE name LIKE '%my%';

SELECT name, COUNT(singer_id) singer_q FROM genre g
JOIN singer_genre sg ON g.genre_id = sg.genre_id
GROUP BY g.name;

SELECT a.prod_year, COUNT(t.album_id) track_q FROM album a 
JOIN track t ON a.album_id = t.album_id
WHERE a.prod_year BETWEEN 2019 AND 2020
GROUP BY a.prod_year;

SELECT a.name, AVG(t.duration) avg_duration FROM album a
JOIN track t ON a.album_id = t.album_id
GROUP BY a.name;

SELECT s.name singer_name, a.name album_name, a.prod_year FROM singer s
JOIN singer_album sa ON s.singer_id = sa.singer_id
JOIN album a ON sa.album_id = a.album_id
WHERE a.prod_year != 2020;

SELECT s.name singer_name, c.name collection_name FROM singer s
JOIN singer_album sa ON s.singer_id = sa.singer_id 
JOIN album a ON sa.album_id = a.album_id 
JOIN track t ON a.album_id = t.album_id 
JOIN collection_track ct ON t.track_id = ct.track_id 
JOIN collection c ON c.collection_id =ct.collection_id 
WHERE s.name = 'Gina Gina';