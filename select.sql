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