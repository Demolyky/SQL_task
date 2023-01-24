CREATE TABLE Executor (
    id_executor SERIAL PRIMARY KEY,
    nickname VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL);

CREATE TABLE Genre (
    id_genre SERIAL PRIMARY KEY,
    name VARCHAR(40) UNIQUE NOT NULL);

CREATE TABLE Executor_genre (
    id_executor_genre SERIAL PRIMARY KEY,
    executor INTEGER NOT NULL REFERENCES Executor(id_executor),
    genre INTEGER NOT NULL REFERENCES Genre(id_genre));

CREATE TABLE Collection (
    id_collection SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    release_date DATE DEFAULT CURRENT_DATE CHECK (release_date <= CURRENT_DATE));

CREATE TABLE Album (
    id_album SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    release_date DATE DEFAULT CURRENT_DATE CHECK (release_date <= CURRENT_DATE));

CREATE TABLE Song (
    id_song SERIAL PRIMARY KEY,
    duration INTEGER NOT NULL CHECK (duration > 0),
    albums INTEGER NOT NULL REFERENCES Album(id_album));

CREATE TABLE Songs_collections (
    id_songs_collections SERIAL PRIMARY KEY,
    song INTEGER NOT NULL REFERENCES Song(id_song),
    collection INTEGER NOT NULL REFERENCES Collection(id_collection));

CREATE TABLE Executor_album (
    id_executor_album SERIAL PRIMARY KEY,
    executor INTEGER NOT NULL REFERENCES Executor(id_executor),
    album INTEGER NOT NULL REFERENCES Album(id_album));