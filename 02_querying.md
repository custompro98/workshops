<!--Meta theme:solarized title:Learn SQL 02-->

<!--sec 1.1-->
## How do we data out?

<!--sec 1.2-->
```sql
SELECT 'Hello, World!'
```

Note:
SELECT is how we identify which pieces of data you want back
<!--sec 2.1-->
## But we want the data from our tables

<!--sec 2.2-->
```sql
SELECT *
FROM   posts
```

Note:
Go over the columns in the table, mention that it's common to have an id column
<!--sec 2.3-->
## What if we only want to see the names of authors?

<!--sec 2.4-->
```sql
SELECT name
FROM   authors
```

<!--sec 3.1-->
## How do we search through the tables?

<!--sec 3.2-->
```sql
SELECT title
FROM   posts
WHERE  title = 'Title 7'
```

<!--sec 4.1-->
## How would we only get post titles for a certain author?

Note:
Let someone guess how to go about this, they might think to use WHERE author id
<!--sec 4.2-->
```sql
SELECT posts.title
FROM   posts
JOIN   authors ON posts.author_id = authors.id
WHERE  authors.name = 'Mitch Joa'
```

<!--sec 4.3-->
## How do we find the author of a certain post?

<!--sec 4.4-->
```sql
SELECT authors.name
FROM   posts
JOIN   authors ON posts.author_id = authors.id
WHERE  posts.title = 'Title 9'
```
