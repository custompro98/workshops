<!--Meta theme:solarized title:Learn GraphQL 03-->

<!--sec 1.1-->
# Server-Side Nomenclature

<!--sec 2.1-->
## Schema

<!--sec 2.2-->
The structure of the graph

NOTE: this is very much like a relational database schema

<!--sec 2.3-->
The `schema.rb` file defines the entry points for queries and mutations (more on those later)

<!--sec 2.4-->
Takes over the routing responsibilities by parsing query to determine where to send it

<!--sec 3.1-->
## Type

<!--sec 3.2-->
Defines the types of nodes on the graph

<!--sec 3.3-->
In the users/posts example, there would be a `UserType` and a `PostType`

<!--sec 4.1-->
## Query Type

<!--sec 4.2-->

The anonymous entrypoint for queries

<!--sec 4.3-->
Every GraphQL endpoint has a QueryType

NOTE: the schema directs this request to the query type and the query type propogates to the user type

<!--sec 5.1-->
## Mutation Type

<!--sec 5.2-->
The anonymous entrypoint for mutations

NOTE: the schema directs this request to the mutation type and the mutation type propogates to the user type

<!--sec 5.3-->
Any non read-only GraphQL endpoint has a MutationType

<!--sec 6.1-->
Congrats, now you know all the GraphQL words that I know

<!--sec 6.2-->
Let's build some stuff
