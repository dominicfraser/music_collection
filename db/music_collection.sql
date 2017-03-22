DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  artist_id INT4 REFERENCES artists(id),
  title VARCHAR(255),
  genre VARCHAR(255)
);

INSERT INTO artists (name) VALUES ('artist1');
INSERT INTO artists (name) VALUES ('artist2');
INSERT INTO artists (name) VALUES ('artist3');
INSERT INTO artists (name) VALUES ('artist4');
INSERT INTO albums (artist_id, title, genre) VALUES (1, 'album1','genre1');
INSERT INTO albums (artist_id, title, genre) VALUES (2, 'album2','genre2');
INSERT INTO albums (artist_id, title, genre) VALUES (3, 'album3','genre2');
INSERT INTO albums (artist_id, title, genre) VALUES (4, 'album4','genre2');
INSERT INTO albums (artist_id, title, genre) VALUES (4, 'album5','genre1');

-- SELECT * FROM artists;
-- SELECT * FROM albums;