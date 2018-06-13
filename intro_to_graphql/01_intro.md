<!--Meta theme:solarized title:Learn GraphQL 01-->

<!--sec 1.1-->
# What is GraphQL?

<!--sec 1.2-->
## A Query Language for Your API*
An API design spec meant to facilitate only selecting data you need

<!--sec 2.1-->
## What makes it a Query Language?
Instead of passing in params to a specific endpoint determine the shape of results, you specify the shape directly to a single endpoint

NOTE: show SWAPI's GraphiQL

<!--sec 2.2-->
```json
users {
  posts {
    title
    content
  }
}
```

<!--sec 3.1-->
## What makes it a Graph?

<!--sec 3.2-->
I think this is the harder concept to grasp

<!--sec 3.3-->
REST has nested objects
```json
users: [
  ...,
  posts: [
    ...
  ]
]
```

<!--sec 3.4-->
Where GraphQL has connections

```json
users: [
  ...,
  posts: {
    totalCount: 10,
    edges {
      node {
        title,
        content
      }
    }
  }
]
```

NOTE: think about edges as the relationship to the other object.
i.e. A user _authored_ a post, so the edge "authored" connects nodes "user" and "post"

<!--sec 3.5-->
The REST version looks smaller, but the GraphQL version better illustrates relationships among data

<!--sec 4.1-->
[Next Steps](learn-graphql-02.html)
