`sqlite3 sample_db.sqlite3 "DROP TABLE IF EXISTS posts"`
`sqlite3 sample_db.sqlite3 "DROP TABLE IF EXISTS authors"`

`sqlite3 sample_db.sqlite3 "CREATE TABLE posts(id INTEGER, author_id INTEGER, title STRING, content STRING)"`
`sqlite3 sample_db.sqlite3 "CREATE TABLE authors(id INTEGER, name STRING)"`

(1..50).each do |n|
  `sqlite3 sample_db.sqlite3 "INSERT INTO posts(id, author_id, title, content) VALUES (#{n}, #{(n % 8) + 1}, 'Title #{n}', 'Content #{n}')"`
end

`sqlite3 sample_db.sqlite3 "INSERT INTO authors(id, name) VALUES (1, 'Mitch Joa')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(id, name) VALUES (2, 'Danny Davidson')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(id, name) VALUES (3, 'Kuu Hubbard')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(id, name) VALUES (4, 'Thomas Huang')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(id, name) VALUES (5, 'Adam Pogwizd')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(id, name) VALUES (6, 'Noah Conley')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(id, name) VALUES (7, 'Iana Gandziuk')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(id, name) VALUES (8, 'Tom Benneche')"`
