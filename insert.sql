INSERT INTO genre
    (id_genre, name)
VALUES
    (1, 'Реп'),
    (2, 'Рок'),
    (3, 'Репкор'),
    (4, 'Hip-Hop'),
    (5, 'Джаз'),
    (6, 'Инди');

INSERT INTO executor
    (id_executor, nickname, first_name, last_name)
VALUES
    (1, 'Noize MC', 'Иван', 'Алексеев'),
    (2, 'Animal Джаz', 'Александр', 'Красовицкий'),
    (3, 'Linkin Park', 'Chester', 'Benington'),
    (4, 'Zero People', 'Александр', 'Красовицкий'),
    (5, 'KOPENGAGEN', 'Антон', 'Корсюков'),
    (6, 'Sirotkin', 'Сергей', 'Сироткин'),
    (7, 'Nizkiz', 'Александр', 'Ильин'),
    (8, 'Three Days Grace', 'Nill', 'Sanderson');

INSERT INTO album (name, release_date) VALUES ('Вода', '01.01.2017');
INSERT INTO song (name, duration, albums_id) VALUES ('Облака', 235, lastval());
INSERT INTO album (name, release_date) VALUES ('Эхопарк', '01.01.2015');
INSERT INTO song (name, duration, albums_id) VALUES ('Выше домов', 288, lastval());
INSERT INTO album (name, release_date) VALUES ('Вояжер-1', '01.01.2020');
INSERT INTO song (name, duration, albums_id) VALUES ('Вояжер-1', 214, lastval());
INSERT INTO album (name, release_date) VALUES ('Время люить', '01.01.2020');
INSERT INTO song (name, duration, albums_id) VALUES ('Ключи', 191, lastval());
INSERT INTO album (name, release_date) VALUES ('Meteora', '01.01.2003');
INSERT INTO song (name, duration, albums_id) VALUES ('Numb', 187, lastval());
INSERT INTO album (name, release_date) VALUES ('Красота', '01.01.2003');
INSERT INTO song (name, duration, albums_id) VALUES ('Стена', 267, lastval());
INSERT INTO album (name, release_date) VALUES ('100 лет одиночества', '01.01.2017');
INSERT INTO song (name, duration, albums_id) VALUES ('100 лет одиночества', 218, lastval());
INSERT INTO album (name, release_date) VALUES ('Синоптик', '01.01.2017');
INSERT INTO song (name, duration, albums_id) VALUES ('Синоптик', 356, lastval());
INSERT INTO album (name, release_date) VALUES ('Human', '01.01.2015');
INSERT INTO song (name, duration, albums_id) VALUES ('I Am Machine', 200, lastval());
INSERT INTO album (name, release_date) VALUES ('The Greatest Hits. Vol. 1', '01.02.2018');
INSERT INTO song (name, duration, albums_id) VALUES ('Мое море', 153, lastval());

INSERT INTO song (name, duration, albums_id)
VALUES  ('Навсегда', '200', 2),
        ('Вояжер-1 Lab', '214', 3),
        ('Вояжер-1 Undergroover Rework', '214', 3),
        ('Вояжер-1 Оркестр', '214', 3),
        ('Апрель', '306', 4),
        ('Мистика', '227', 4);

INSERT INTO executor_album (executor_id, album_id)
    VALUES  (6, 1),
            (6, 2),
            (1, 3),
            (2, 4),
            (3, 5),
            (4, 6),
            (5, 7),
            (7, 8),
            (8, 9),
            (1, 10);

INSERT INTO executor_genre (executor_id, genre_id)
    VALUES  (1, 1),
            (1, 2),
            (1, 3),
            (2, 2),
            (2, 5),
            (3, 2),
            (3, 3),
            (3, 4),
            (4, 5),
            (4, 6),
            (5, 2),
            (6, 6),
            (7, 2),
            (8, 2);

INSERT INTO collection (id_collection, name, release_date)
    VALUES  (1, 'RuRock', '01.01.2018'),
            (2, 'RuREP', '01.01.2018'),
            (3, 'Лучшее инди', '01.01.2022'),
            (4, 'Зарубежный Рок', '01.01.2017'),
            (5, 'Хиты года', '01.01.2021'),
            (6, 'Лучшие песни Красовицкого', '01.01.2023'),
            (7, 'Памяти Честера', '07.26.2017'),
            (8, 'Лучшие Петербуржцы', '01.01.2020');

INSERT INTO songs_collections (song_id, collection_id)
    VALUES  (4, 1),
            (7, 1),
            (14, 1),
            (15, 1),
            (3, 2),
            (1, 3),
            (2, 3),
            (10, 3),
            (5, 4),
            (9, 4),
            (9, 5),
            (4, 6),
            (6, 6),
            (5, 7),
            (7, 8);

