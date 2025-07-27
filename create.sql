CREATE TABLE Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year INT NOT NULL
);

CREATE TABLE Tracks (
    track_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration FLOAT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

CREATE TABLE Compilations (
    compilation_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    year INT NOT NULL
);

CREATE TABLE ArtistGenres (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE ArtistAlbums (
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

CREATE TABLE CompilationTracks (
    compilation_id INT NOT NULL,
    track_id INT NOT NULL,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES Compilations(compilation_id),
    FOREIGN KEY (track_id) REFERENCES Tracks(track_id)
);
