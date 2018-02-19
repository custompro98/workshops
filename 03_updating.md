<!--Meta theme:solarized title:Learn SQL 03-->

<!--sec 1.1-->
## Now let's change some of this data

<!--sec 1.2-->
```sql
UPDATE posts
SET    title = 'Here is a new title'
```

<!--sec 2.1-->
## Uhoh, that changed everything...
### Let's reset the database
```sh
ruby build_db.rb
```

<!--sec 2.2-->
## Any ideas on how to only update posts where a condition is met?

<!--sec 2.3-->
```sql
UPDATE posts
SET    title = "Mitch's Post"
WHERE  author_id IN (SELECT id 
                     FROM   authors 
                     WHERE  name = 'Mitch Joa')
```

Note:
Other versions of SQL (PostgreSQL, MySQL, etc.) support some form of JOIN in an update

<!--sec 3.1-->
## If we can change it, we can make it, right?

<!--sec 3.2-->
```sql
INSERT INTO posts (author_id, title, content)
VALUES (1, 'Here is a title', 'Here is some content')
```

<!--sec 3.3-->
## I have more than one post to insert, do I have to do this every time?

<!--sec 3.4-->
```sql
INSERT INTO posts (author_id, title, content)
VALUES (1, 'Here is a title', 'Here is some content'),
       (1, 'Here is another', 'Here is some more')
```

<!--sec 4.1-->
## And now the most dangerous form of update...

<!--sec 4.2-->
# DELETE

<!--sec 4.3-->
```sql
DELETE
FROM  posts
WHERE author_id IN (SELECT id
                    FROM   authors
                    WHERE  name = 'Mitch Joa')
```

Note:
Again, other versions of SQL support some form of JOIN in a delete as well

<!--sec 5.1-->
## What is "soft-deleting" then?

<!--sec 5.2-->
It's just updating a database row to have its `deleted` column be true

<!--sec 5.3-->
```sql
UPDATE posts
SET    deleted = true
WHERE  title = 'Title 1'
```

<!--sec 6.1-->
[Next Steps](learn-sql-04.html)
