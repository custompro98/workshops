<!--Meta theme:solarized title:LnL GraphQL-->

<!--sec 1.1-->
# GraphQL and Chill

<!--sec 1.2-->
Before we get into an analogy we need to know

<!--sec 1.3-->
## What is GraphQL?

<!--sec 1.4-->
## A Query Language for Your API*
An API design spec meant to facilitate only selecting data you need

NOTE: I put an asterisk here because the query language part is really secondary.

<!--sec 1.5-->
Primarily it organizes your data as a graph

NOTE: If you take away one thing from this lunch and learn, it should be this

<!--sec 1.6-->
The consumer shouldn't think of your API as an application they need to interface with, but as a pile of data at its disposal

<!--sec 2.1-->
## What makes it a Query Language?
Instead of passing params to a specific endpoint to determine the shape of results, you specify the shape directly to a single endpoint

<!--sec 2.2-->
```json
query {
  users {
    posts {
      title
      content
    }
  }
}
```

<!--sec 3.1-->
## What makes it a Graph?

<!--sec 3.2-->
REST has nested objects
```json
users: [
  ...,
  posts: [
    ...
  ]
]
```

<!--sec 3.3-->
Where GraphQL has connections

```json
users: [
  ...,
  authoredPosts: {
    totalCount: 10,
    edges {
      authoredOn,
      node {
        title,
        content
      }
    }
  }
]
```

NOTE: think about edges as the relationship to the other object.
These edges contain metadata about the nodes
i.e. A user _authored_ a post, so the edge "authored" connects nodes "user" and "post" and would know when the event occurred

<!--sec 3.4-->
The REST version looks smaller, but the GraphQL version better illustrates relationships among data

<!--sec 3.5-->
![graph](images/graph.png)

<!--sec 4.1-->
## REST is Cable

NOTE: It's the big kid on the block

<!--sec 4.2-->
### Bundling channels for a promotional price

NOTE: maybe even internet and a phone line
You don't want or need these channels, but to get Cartoon Network you need TBS

<!--sec 4.3-->
### Flipping to a channel

NOTE: you have to load a channel to see what's on
If it's not what you want, you load the next channel
If what you want to watch isn't on, you're out of luck
Channels are like network requests, you have to load it to see what it is

<!--sec 4.4-->
### TV Guide

NOTE: you might have thought, well Mitch, there's a TV guide so I can go directly to a channel I know I want
A TV guide is like an index page, you only get the title and a summary of the show, not the actual show
And if the show isn't on, you're just out of luck

<!--sec 4.5-->
### TV Guide Previews

NOTE: Gotcha again, I can have a live preview of a channel from the guide
Well, that means every channel's preview is included in the guide every time
We're cramming more and more into the guide that you don't always want
Every time we open the guide, we NEED to load all of this data
There has to be an easier way

<!--sec 5.1-->
## GraphQL is Streaming Services

NOTE: It's the new kid and that makes the big kid nervous

<!--sec 5.2-->
### Netflix

NOTE: you have access to all of the shows in the library, similar to all the channels in a bundle

<!--sec 5.3-->
### Turning on a show

NOTE: You search for any show you want, start playing - no flipping through channels, no concept of "is it on?"

<!--sec 5.4-->
### Netflix doesn't have the show I want

NOTE: You're thinking that Netflix doesn't have every show ever created

<!--sec 5.5-->
Then let's try Hulu or Amazon Prime or whatever else

<!--sec 5.6-->
### I can search through any and all streaming networks

NOTE: I could already have access to all of them, use a free trial, or cancel one for another
GraphQL calls this schema stitching, a GraphQL API can do as little as forward requests to another API or have its own store of data to display
This is a really powerful concept that helps large APIs convert, simply point everything at your existing REST API so consumers can build out support at the same time your GraphQL API is coming online

<!--sec 6.1-->
## Coexistence

NOTE: REST and GraphQL actually work really well together
for all the talk of "REST-killer" one doesn't have to "kll" the other

<!--sec 6.2-->
### Parents

NOTE: you probably aren't going to tell your parents to cut cable
It makes sense to them, it works, they already have it

<!--sec 6.3-->
### Siblings

NOTE: But you might tell your sibling who's moving to a new apartment to try cutting cable

<!--sec 6.4-->
### Choose what works

NOTE: In the same sense, you can have GraphQL manage the read portion of your API and rely on REST to handle create, update, delete
Or you can have GraphQL handle CRUD while you use REST for auth
It's entirely up to you how far you want to dive in
At the end of the day, choose what works for you

<!--sec 7.1-->
## Why use GraphQL?

<!--sec 7.2-->
## Why use GraphQL?
- Your objects can be connected to other objects

<!--sec 7.3-->
## Why use GraphQL?
- Your objects can be connected to other objects
- Your consumers don't always want all of the connected objects

<!--sec 7.4-->
## Why use GraphQL?
- Your objects can be connected to other objects
- Your consumers don't always want all of the connected objects
- You want to make your consumers happy
