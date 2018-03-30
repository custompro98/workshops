<!--Meta theme:solarized title:Learn SQL 04-->

<!--sec 1.1-->
## Aggregations

<!--sec 1.2-->
- `COUNT`
- `MIN`
- `MAX`

<!--sec 2.1-->
## How can we see the count of posts?

<!--sec 2.2-->
```sql
SELECT COUNT(posts.id)
FROM   posts
```

<!--sec 2.3-->
## How can we see the count of posts per author?

<!--sec 2.4-->
```sql
SELECT author_id, COUNT(posts.id)
FROM   posts
GROUP BY author_id
```

<!--sec 2.7-->
## The author id is neat, but can we see the author's name?

<!--sec 2.6-->
```sql
SELECT authors.name, COUNT(posts.id)
FROM   posts
JOIN   authors ON posts.author_id = authors.id
GROUP BY authors.name
```

Note:
If we're going to GROUP BY something, it needs to appear in the SELECT and vice versa.  This is more reasonable when we think about it in terms of needing to see what the aggregate is associated with. i.e. the COUNT needs a label to describe what it's counting.
<!--sec 3.1-->
## Can we order by COUNT?

<!--sec 3.2-->
Yes, just like we'd expect
```sql
SELECT authors.name, COUNT(posts.id)
FROM   posts
JOIN   authors ON posts.author_id = authors.id
GROUP BY authors.name
ORDER BY COUNT(posts.id) DESC
```

<!--sec 4.1-->
## What if we only want to see authors with more than 6 posts?

<!--sec 4.2-->
We also have the `HAVING` clause!

<!--sec 4.3-->
```sql
SELECT authors.name, COUNT(posts.id) AS post_count
FROM   posts
JOIN   authors ON posts.author_id = authors.id
GROUP BY authors.name
HAVING post_count > 6
```

<!--sec 5.1-->
## And now you know the basics of querying in SQL

<!--sec 5.2-->
Have fun 😃
