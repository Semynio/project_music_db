INSERT INTO Genres (name) VALUES
('Рок'), ('Поп'), ('Джаз');

INSERT INTO Artists (name) VALUES
('Моцарт'), ('Чайковский'), ('Бах'), ('Шопен');

INSERT INTO Albums (title, year) VALUES
('Лучшее от Моцарта', 2019),
('Звуки джаза', 2020),
('Поп-хиты', 2018);

INSERT INTO Tracks (title, duration, album_id) VALUES
('Симфония №40', 35.2, 1),
('Джазовая ночь', 4.5, 2),
('Поп-мелодия', 3.7, 3),
('Соната', 6.0, 1),
('Джаз-блюз', 5.5, 2),
('Хит 2020', 3.9, 3);

INSERT INTO Compilations (title, year) VALUES
('Классика', 2018),
('Лучшее 2019', 2019),
('Джаз и Рок', 2020),
('Популярное', 2018);

INSERT INTO ArtistGenres (artist_id, genre_id) VALUES
(1, 1),
(2, 3),
(3, 1),
(4, 2);

INSERT INTO ArtistAlbums (artist_id, album_id) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3);

INSERT INTO CompilationTracks (compilation_id, track_id) VALUES
(1, 1),
(1, 4),
(2, 3),
(2, 6),
(3, 2),
(3, 5),
(4, 3);
