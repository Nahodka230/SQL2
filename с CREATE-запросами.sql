CREATE TABLE IF NOT EXISTS album (
album_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
prod_year integer
);

CREATE TABLE IF NOT EXISTS track (
track_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
duration INTEGER,
album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS genre (
genre_id SERIAL PRIMARY KEY,
name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS singer (
singer_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
genre_id INTEGER NOT NULL REFERENCES genre(genre_id)
);

CREATE TABLE IF NOT EXISTS singer_album (
	singer_id INTEGER REFERENCES singer(singer_id),
	album_id INTEGER REFERENCES album(album_id),
	CONSTRAINT pk PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS singer_genre (
	singer_id INTEGER REFERENCES singer(singer_id),
	genre_id INTEGER REFERENCES genre(genre_id),
	CONSTRAINT sg PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS collection (
collection_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
prod_year integer
);

CREATE TABLE IF NOT EXISTS collection_track (
	collection_id INTEGER REFERENCES collection(collection_id),
	track_id INTEGER REFERENCES track(track_id),
	CONSTRAINT ct PRIMARY KEY (collection_id, track_id)
);
