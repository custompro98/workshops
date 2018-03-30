<!--Meta theme:solarized title:Learn SQL 02-->

<!--sec 1.1-->
## How do we get data out?

<!--sec 1.2-->
```sql
SELECT 'Hello, World!'
```

Note:
In pretty much every learn to program tutorial, the first step is a "Hello, World!" program.  That simply outputs "Hello, World!"
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

Note:
We have =,<,> operators as well

<!--sec 4.1-->
## What if we have multiple search criteria?

<!--sec 4.2-->
```sql
SELECT title
FROM   posts
WHERE  author_id = 6
  AND  (title = 'Title 7'
   OR  title = 'Title 8')
```

<!--sec 5.1-->
## How would we only get post titles for a certain author?

Note:
Let someone guess how to go about this, they might think to use WHERE author id
<!--sec 5.2-->
```sql
SELECT posts.title
FROM   posts
JOIN   authors ON posts.author_id = authors.id
WHERE  authors.name = 'Mitch Joa'
```

<!--sec 5.3-->
## How do we find the author of a certain post?

<!--sec 5.4-->
```sql
SELECT authors.name
FROM   posts
JOIN   authors ON posts.author_id = authors.id
WHERE  posts.title = 'Title 9'
```

<!--sec 6.1-->
## How is order decided?

<!--sec 6.2-->
Selections are in the order in which they were created by default

Note:
i.e. They're in order by id typically
<!--sec 6.3-->
## That doesn't seem very useful...

<!--sec 6.4-->
That's why we have the `ORDER BY` clause!

<!--sec 6.5-->
## How would we order posts by their title?

<!--sec 6.6-->
```sql
SELECT *
FROM   posts
ORDER BY title ASC
```

Note:
We can use ASC or DESC, ASC is the default

<!--sec 7.1-->
## We're getting back too many results, how can we paginate?

<!--sec 7.2-->
## The `limit` and `offset` clauses!

<!--sec 7.3-->
## Here's how we get the second page of 10 posts
```sql
SELECT *
FROM   posts
LIMIT  10
OFFSET 10
```

<!--sec 7.1-->
[Next Steps](learn-sql-03.html)
