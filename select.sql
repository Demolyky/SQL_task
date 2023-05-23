/* ЗАДАНИЕ 3. ПРОСТЫЕ ЗАПРОСЫ */
SELECT  name            AS  Название,
        release_date    AS  Дата_выхода
FROM    album
WHERE   release_date > '01.01.2018';

SELECT  name        AS Название,
        duration    AS Продолжительность
FROM    song
WHERE   duration = (SELECT MAX(duration) FROM song);

SELECT  name AS Название
FROM    song
WHERE   duration > (3.5*60);

SELECT  name AS Название
FROM    collection
WHERE   release_date > '01.01.2018' AND release_date < '01.01.2020';

SELECT  nickname AS Исполнитель
FROM    executor
WHERE   nickname NOT LIKE '% %';

SELECT  name AS Название_песни
FROM    song
WHERE   name LIKE '%мой%' or name LIKE '%my%' or name LIKE '%Мое%';

/*ЗАДАНИЕ 4. Сложные запросы*/
/*количество исполнителей в каждом жанре;*/
SELECT Genre.name AS Название, COUNT(id_executor_genre) AS "Число исполнителей"
FROM Genre
LEFT JOIN executor_genre eg ON Genre.id_genre = eg.genre_id
GROUP BY Genre.name;


/*количество треков, вошедших в альбомы 2019-2020 годов;*/
SELECT COUNT(id_album) FROM Album /* Количество айди треков из таблицы треков */
JOIN Song s ON Album.id_album = s.albums_id /* Делаем объединение от таблицы треков к альбомам */
WHERE Album.release_date BETWEEN '01.01.2019' and '12.31.2020'; /* Где год альбома находится в требуемом промежутке */

/*средняя продолжительность треков по каждому альбому;*/
SELECT Album.name, AVG(duration) FROM Album
JOIN Song s on Album.id_album = s.albums_id
GROUP BY Album.name
ORDER BY Album.name;

/*все исполнители, которые не выпустили альбомы в 2020 году;*/
SELECT Executor.nickname
FROM Executor
WHERE Executor.nickname NOT IN (
    SELECT Executor.nickname
    FROM Executor
    JOIN Executor_album ON Executor.id_executor = Executor_album.executor_id
    JOIN Album ON Executor_album.album_id = Album.id_album
    WHERE EXTRACT(YEAR FROM Album.release_date) = 2020
);

/*наименование треков, которые не входят в сборники;*/
SELECT Song.name FROM Song
FULL JOIN Songs_collections sc ON Song.id_song = sc.song_id
WHERE sc.id_songs_collections IS NULL;

/*название альбомов, содержащих наименьшее количество треков.*/
SELECT Album.name, COUNT(Song.id_song) AS num_songs
FROM Album
JOIN Song ON Song.albums_id = Album.id_album
GROUP BY Album.id_album, Album.name
HAVING COUNT(Song.id_song) = (
  SELECT MIN(num_songs)
  FROM (
    SELECT COUNT(Song.id_song) AS num_songs
    FROM Album
    JOIN Song ON Song.albums_id = Album.id_album
    GROUP BY Album.id_album
  ) subquery
);

/*Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).*/
SELECT Collection.name
FROM Collection
JOIN Songs_collections ON Songs_collections.collection_id = Collection.id_collection
JOIN Song ON Song.id_song = Songs_collections.song_id
JOIN Album ON Album.id_album = Song.albums_id
JOIN Executor_album ON Executor_album.album_id = Album.id_album
JOIN Executor ON Executor.id_executor = Executor_album.executor_id
WHERE Executor.nickname = 'Noize MC';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT Album.name
FROM Album
JOIN Song ON Song.albums_id = Album.id_album
JOIN Executor_album ON Executor_album.album_id = Album.id_album
JOIN (
    SELECT Executor_genre.executor_id
    FROM Executor_genre
    GROUP BY Executor_genre.executor_id
    HAVING COUNT(DISTINCT Executor_genre.genre_id) > 1
) AS multi_genre_executors ON multi_genre_executors.executor_id = Executor_album.executor_id
GROUP BY Album.id_album, Album.name;


-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT DISTINCT Executor.nickname
FROM Executor
JOIN Executor_album ON Executor_album.executor_id = Executor.id_executor
JOIN Album ON Album.id_album = Executor_album.album_id
JOIN Song ON Song.albums_id = Album.id_album
WHERE Song.duration = (
    SELECT MIN(duration)
    FROM Song
);

