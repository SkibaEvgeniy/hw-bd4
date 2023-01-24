SELECT name, year_of_production FROM album_name
WHERE year_of_production = 2018;

SELECT name, length FROM track_name
WHERE length = (SELECT MAX(length) FROM track_name);

SELECT name FROM track_name
WHERE length >= 3.30;

SELECT name, year_of_production FROM collection
WHERE year_of_production BETWEEN 2018 AND 2020;

SELECT name_alias FROM performers
WHERE name_alias NOT LIKE '% %';

SELECT name FROM track_name
WHERE lower(name) LIKE '%мой%' or name iLIKE '%my%';

--количество исполнителей в каждом жанре

SELECT name, COUNT(name) FROM musical_genres mg 
JOIN genreperformers g  ON g.genre_id = mg.genre_id 
JOIN performers p ON p.performer_id = g.genre_id 
GROUP BY name
ORDER BY COUNT(name);

--количество треков, вошедших в альбомы 2019-2020 годов

SELECT an.name, COUNT(track_name_id) count_track FROM album_name an 
JOIN track_name USING(album_name_id)
WHERE year_of_production BETWEEN 2019 AND 2020
GROUP BY an.name;

--средняя продолжительность треков по каждому альбому

SELECT an.name, AVG(length) avg_length FROM album_name an 
JOIN track_name USING(album_name_id)
GROUP BY an.name;

--все исполнители, которые не выпустили альбомы в 2020 году

SELECT DISTINCT name_alias FROM performers
WHERE name_alias NOT IN (
	SELECT name_alias FROM performers
	JOIN performersalbum p2 USING(performer_id)
	JOIN album_name an USING(album_name_id)
	WHERE year_of_production = 2020);

--названия сборников, в которых присутствует конкретный исполнитель

SELECT DISTINCT c.name FROM collection c 
JOIN collectiontrack USING(collection_id)
JOIN track_name USING(track_name_id)
JOIN album_name USING(album_name_id)
JOIN performersalbum USING(album_name_id)
JOIN performers USING(performer_id)
WHERE name_alias ILIKE 'Bob Marley';

--название альбомов, в которых присутствуют исполнители более 1 жанра

SELECT an.name FROM album_name an
JOIN performersalbum USING(album_name_id)
JOIN performers USING(performer_id)
JOIN genreperformers USING(performer_id)
JOIN musical_genres USING(genre_id)
GROUP BY an.name
HAVING count(*) > 1 ;

--наименование треков, которые не входят в сборники

SELECT tn.name  FROM track_name tn
LEFT JOIN collectiontrack c  USING(track_name_id)
WHERE c.track_name_id IS NULL;

--исполнителя, написавшего самый короткий по продолжительности трек

SELECT name_alias, tn.name, tn.length FROM performers p 
JOIN performersalbum p2 USING(performer_id)
JOIN album_name an USING(album_name_id)
JOIN track_name tn USING(album_name_id)
WHERE length = (SELECT MIN(length) FROM track_name);

--название альбомов, содержащих наименьшее количество треков

SELECT an.name, COUNT(track_name_id) count FROM album_name an 
JOIN track_name tn USING(album_name_id)
GROUP BY an.name
HAVING (SELECT COUNT(track_name_id) FROM track_name tn2
	GROUP BY album_name_id
	ORDER BY COUNT(track_name_id)
	LIMIT 1) = COUNT(track_name_id);


