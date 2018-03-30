`sqlite3 sample_db.sqlite3 "DROP TABLE IF EXISTS posts"`
`sqlite3 sample_db.sqlite3 "DROP TABLE IF EXISTS authors"`

`sqlite3 sample_db.sqlite3 "CREATE TABLE posts(id INTEGER PRIMARY KEY AUTOINCREMENT, author_id INTEGER, title STRING, content STRING, deleted INTEGER DEFAULT false)"`
`sqlite3 sample_db.sqlite3 "CREATE TABLE authors(id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING)"`

(1..50).each do |n|
  `sqlite3 sample_db.sqlite3 "INSERT INTO posts(author_id, title, content) VALUES (#{(n % 8) + 1}, 'Title #{n}', 'Content #{n}')"`
end

`sqlite3 sample_db.sqlite3 "INSERT INTO authors(name) VALUES ('Mitch Joa')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(name) VALUES ('Danny Davidson')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(name) VALUES ('Kuu Hubbard')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(name) VALUES ('Thomas Huang')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(name) VALUES ('Adam Pogwizd')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(name) VALUES ('Noah Conley')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(name) VALUES ('Iana Gandziuk')"`
`sqlite3 sample_db.sqlite3 "INSERT INTO authors(name) VALUES ('Tom Benneche')"`
