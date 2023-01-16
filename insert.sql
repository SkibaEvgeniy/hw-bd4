INSERT INTO musical_genres(genre_id, name)
VALUES (1, 'Rock'), (2, 'Punk'), (3, 'Reggae'), (4, 'Rap'), (5, 'Pop');

INSERT INTO performers(performer_id, name_alias)
VALUES
	(1, 'Кино'), (2, 'Король и Шут'), (3, 'Bob Marley'), (4, 'Miyagi'),
	(5, 'ABBA'), (6, 'Nirvana'), (7, '50 Cent'), (8, 'Michael Jackson');

INSERT INTO genreperformers
VALUES (1, 1), (1, 2), (2, 2), (3, 3), (4, 4), (5, 5), (1, 6), (4, 7), (5, 8);

INSERT INTO album_name(album_name_id, name, year_of_production)
VALUES
	(1, 'Группа крови', 1988), (2, 'Последний герой', 1989),
	(3, 'Ели мясо мужики', 2003), (4, 'Жаль, нет ружья', 2002),
	(5, 'Sun Is Shining', 2019), (6, 'Rastaman Vibration', 1976),
	(7, 'Buster Keaton', 2018),
	(8, 'Arrival', 1976),
	(9, 'Nirvana', 2002),
	(10, 'Rare', 2020),
	(11, 'Farewell My Summer Love', 1984);
	
INSERT INTO performersalbum(album_name_id, performer_id)
VALUES (1, 1), (2, 1), (3, 2), (4, 2),(5, 3), (6, 3), 
	(7, 4), (8, 5), (9, 6), (10, 7), (11, 8);
	
INSERT INTO track_name(name, length, album_name_id)
VALUES 
	('Группа крови', 4.43, 1), ('Закрой за мной дверь, я ухожу', 4.16, 1), ('Война', 4.04, 1),
	('Последний герой', 3.06, 2), ('Мама, мы все тяжело больны', 3.50, 2),
	('Ели мясо мужики', 2.40, 3), ('Камнем по голове', 2.40, 3),
	('Мёртвый анархист', 4.07, 4), ('Мой характер', 3.51, 4),
	('Sun is Shining', 2.11, 5), ('My Cup', 3.32, 5), ('Stop That Train', 2.18, 5),
	('All in One', 3.31, 5),
	('Cry To Me', 2.34, 6), ('Night Shift', 3.11, 6),
	('Captain', 3.34, 7), ('Корабли', 2.51, 7),
	('My Love, My Life', 3.51, 8), ('Money, Money, Money', 3.06, 8),
	('Come As You Are', 3.38, 9), ('Come As You Are', 3.38, 9),
	('Keep your Eyes on yours', 4.05, 10), ('Back 4 That', 3.34, 10),
	('Farewell My Summer Love', 4.23, 11), ('Don not Let It_Get You Down', 3.02, 11);
	
INSERT INTO collection(collection_id, name, year_of_production)
VALUES 
	(1, 'Вечный рок', 2018), (2, 'Dancing', 2022),
	(3, 'Car Music', 2019), (4, 'Искра', 2020),
	(5, 'Love Songs', 2017), (6, 'The Weeknd', 2021),
	(7, 'Hot summer', 2016), (8, 'Best', 2018);

INSERT INTO collectiontrack(collection_id, track_name_id)
VALUES (1, 1), (1, 2), (1, 4),
	(2, 16), (2, 15), (2, 21),
	(3, 13), (3, 14), (3,17),
	(4, 5), (4, 6), (4, 8),
	(5,11), (5, 16), (5, 19),
	(6, 7), (6, 22), (6, 20),
	(7, 18), (7, 3), (7, 13),
	(8, 9), (8,12), (8, 10);
	
