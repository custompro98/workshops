<!--Meta theme:solarized title:Learn GraphQL 02-->

<!--sec 1.1-->
# Client-Side Nomenclature

<!--sec 2.1-->
## Query

<!--sec 2.2-->
A query looks like
```graphql
query {
  user(id: 1) {
    ...
  }
}
```

<!--sec 2.3-->
Query is pretty self-explanatory, it's how we tell GraphQL what we want

<!--sec 2.4-->
A query can take arguments
`user(id: 1)`

<!--sec 2.5-->
Consider these like url params

<!--sec 3.1-->
## Field

NOTE: do something with plurals and contrast to connection

<!--sec 3.2-->
Represents some property on the resulting JSON object

<!--sec 3.3-->
```graphql
query {
  user(id: 1) {
    name,
    email,
    posts: {
      title,
      content
    }
  }
}
```

NOTE: name the field

<!--sec 3.4-->
Let's zoom in on
```graphql
query {
  ...
    posts: {
      ...
    }
  ...
}
```

<!--sec 3.5-->
This is called a plural field

NOTE: it doesn't use edges or nodes because it's just a nested object
These are fine for simple nested objects where pagination or counting isn't necessary
Typically I'd rather it be consistent, but I'm unsure what the actual pattern is

<!--sec 4.1-->
## Connection

<!--sec 4.2-->
A special field that wraps a plural

<!--sec 4.3-->
Connections use edges/nodes to reperesent data

<!--sec 4.4-->
This allows you to nest metadata about the plural field,
like `totalCount` or `pageInfo`

<!--sec 4.5-->
```graphql
pageInfo {
  hasNextPage,
  endCursor
}
```

NOTE: `pageInfo` is a GraphQL convention for pagination

<!--sec 4.6-->
It's typical to use cursor-based pagination, where the endCursor is a hash of the last edge returned

```graphql
query {
  usersConnection(first: <n>, after: <endCursor>) {
    ...
  }
}
```

NOTE: conceptually, this acts as `WHERE id > endCursor LIMIT n`
The name ${Relationship Type}Connection is chosen to allow for newer pagination specs
https://dev-blog.apollodata.com/explaining-graphql-connections-c48b7c3d6976

<!--sec 5.1-->
## Mutation

<!--sec 5.2-->
A mutation looks like
```graphql
mutation {
  createUser(input: { name: "Mitch", ... }) {
    user {
      name
      ...
    }
  }
}
```

NOTE: You can select any fields that would exist on the user object, the body of the mutation is a query

<!--sec 5.3-->
A mutation is how we create or update data in GraphQL

<!--sec 5.4-->
All valid mutations (create, update, delete per object) are defined by the server

<!--sec 6.1-->
## Edge/Node

NOTE: these are going together because they're never used separately

<!--sec 6.2-->
In graph theory, an edge connects two nodes. In GraphQL an edge contains information about the nodes on either end of the edge

<!--sec 6.3-->
The server can tuck metadata into these fields

<!--sec 7.1-->
## Fragment

<!--sec 7.2-->
A partial query that can be reused

<!--sec 7.3-->
This helps DRY up GraphQL queries

<!--sec 7.4-->
Conceptually, you can think of these as partial templates

<!--sec 8.1-->
[Next Steps](learn-graphql-03.html)
