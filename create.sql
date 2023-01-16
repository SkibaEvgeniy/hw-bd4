CREATE TABLE IF NOT EXISTS musical_genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS performers (
	performer_id SERIAL PRIMARY KEY,
	name_alias VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS genreperformers (
	genre_id INTEGER REFERENCES musical_genres(genre_id),
	performer_id INTEGER REFERENCES performers(performer_id),
	CONSTRAINT pk PRIMARY KEY(genre_id, performer_id)
);

CREATE TABLE IF NOT EXISTS album_name (
	album_name_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	year_of_production INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS performersalbum (
	album_name_id INTEGER REFERENCES album_name(album_name_id),
	performer_id INTEGER REFERENCES performers(performer_id),
	CONSTRAINT pk1 PRIMARY KEY(album_name_id, performer_id)
);

CREATE TABLE IF NOT EXISTS track_name (
	track_name_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	length NUMERIC NOT NULL,
	album_name_id INTEGER REFERENCES album_name(album_name_id)
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL,
	year_of_production INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS collectiontrack (
	collection_id INTEGER REFERENCES collection(collection_id),
	track_name_id iNTEGER REFERENCES track_name(track_name_id),
	CONSTRAINT pk2 PRIMARY KEY (collection_id, track_name_id)
);

