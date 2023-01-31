CREATE TABLE IF NOT EXISTS Executor (
    PRIMARY KEY (id_executor),
    id_executor SERIAL,
    nickname    VARCHAR(100)    UNIQUE NOT NULL,
    first_name  VARCHAR(40)     NOT NULL,
    last_name   VARCHAR(40)     NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre (
    PRIMARY KEY (id_genre),
    id_genre    SERIAL,
    name        VARCHAR(40)     UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Executor_genre (
    PRIMARY KEY (id_executor_genre),
    id_executor_genre   SERIAL,
    executor_id            INTEGER NOT NULL REFERENCES Executor(id_executor),
    genre_id               INTEGER NOT NULL REFERENCES Genre(id_genre)
);

CREATE TABLE IF NOT EXISTS Collection (
    PRIMARY KEY (id_collection),
    id_collection   SERIAL,
    name            VARCHAR(40) NOT NULL,
    release_date    DATE        DEFAULT     CURRENT_DATE,
                    CHECK (release_date <= CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS Album (
    PRIMARY KEY (id_album),
    id_album        SERIAL,
    name            VARCHAR(40)    NOT NULL,
    release_date    DATE           DEFAULT    CURRENT_DATE,
                    CHECK          (release_date <= CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS Song (
    PRIMARY KEY (id_song),
    id_song     SERIAL,
    name        VARCHAR(40),
    duration    INTEGER     NOT NULL,
    albums_id   INTEGER     NOT NULL    REFERENCES Album(id_album),
                CHECK (duration > 0)
);

CREATE TABLE IF NOT EXISTS Songs_collections (
    PRIMARY KEY (id_songs_collections),
    id_songs_collections    SERIAL,
    song_id                 INTEGER NOT NULL REFERENCES Song(id_song),
    collection_id           INTEGER NOT NULL REFERENCES Collection(id_collection)
);

CREATE TABLE IF NOT EXISTS Executor_album (
    PRIMARY KEY (id_executor_album),
    id_executor_album   SERIAL,
    executor_id         INTEGER NOT NULL REFERENCES Executor(id_executor),
    album_id            INTEGER NOT NULL REFERENCES Album(id_album)
);