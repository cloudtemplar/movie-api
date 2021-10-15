# README

This is a simple GraphQL API which lets users to:
* add movies to movies catalog (cinema owners)
* create and update movie showings with price and show times (cinema owners)
* browse movies catalog and seeing movie ratings
* see informations about showings (time and prices)
* rate movies

## Technologies
* API is developed using Ruby implementation of GraphQL
* Requests are authenticated using Token-based authentication
* There is role-based authorization enforced with ActionPolicy

## GraphQL

I've chosen GQL to implement the API.
* It provides separation of saves and writes using queries and mutations (pseudo-CQRS)
* It gives you free documentation browser because of its ability to do introspection of schema
* It validates inputs
* Since the app is meant to be used by a mobile app developer, GQL is perfect, because you can request only what you really need. After all, it was created by Facebook for this specific purpose

## Installation

* `git clone git@github.com:cloudtemplar/movie-api.git`
* `bundle install`
* `rails db:seed`
* You need to run `bin/rails credentials:edit` and add your access key there, so it's available with `Rails.application.credentials.omdb.fetch :access_key`

## Authentication & Authorization

In order to be able to make requests, you need to get to the `rails console`, create an User and copy the API token:
`api_token = Authentication::User.create(email: 'boss@gmail.com', password: '12345678', role: :cinema_owner).api_token`

Now you can use cURL or Postman to make requests. To do so, you need to include an auth header: `Authorization => Bearer <api_token>`.
Remember that all GQL requests should be POST requests.
![image](https://user-images.githubusercontent.com/11062130/137529410-9cce271d-4e7b-433e-b267-001df1e0fb4b.png)


Depending whether you choose `:cinema_owner` or `:movie_goer` as a role, you will be able to do different things (see above)

## Documentation

I didn't include any documentation using either Swagger nor OpenAPI. Why? Because I have mounted GraphiQL engine, where you can interactively browse available queries and mutations. It gives you everything you need, including code completion.

![image](https://user-images.githubusercontent.com/11062130/137528639-fac93316-585a-41fb-9228-268f5089ccaf.png)

To browse documentation, you need to:
* run the server (`rails s`)
* go to localhost:3000/graphiql

## Assumptions and shortcuts

I've made several shortcuts and assumptions while developing this. Some things to work on to make it better:

TODOS:
- [ ] Add rack attack middleware
- [ ] Set maximum nesting depth for GQL queries and introduce timeouts
- [ ] Devise's User classes tend to become god models as the app grows. I would refactor it, so `Password` would be responsible for Devise auth, and something like `Profile` would hold user specific data and behaviours
- [ ] Inside queries and mutations, you don't need to pass explicit `context` to policies if you set the default context configuration
- [ ] In seeds I am calling the external OMDB API to fetch initial movies, which is a REALLY BAD IDEA. Your seeds should not be dependent on external factors, because your deployments would fail.
- [ ] It's possible to implement cursor-based pagination for GraphQL queries
- [ ] I should automatically include `graphql test` context in every spec.
- [ ] It's possible to get rid of raw GQL queries from specs and provide them with separate gql files.
- [ ] Make cinema owners' specific queries and mutations invisible to movie goers using `authorized_field` helpers from ActionPolicy
- [ ] add Money to handle ticket prices
- [ ] Use OffsetDateTime for show times
- [ ] add sensible error handling to GQL
- [ ] I am calling OMDB Api in specs, and this is UNACCEPTABLE too. Normally I would use VCR library to isolate specs from external API. It pre-records 'casettes' with API responses, so when it detects a query that it knows about, it returns mocked responses.  https://github.com/vcr/vcr
- [ ] Several more mutations would come in handy, like ability to delete movie showings
- [ ] I should clean specs using shared contexts
- [ ] Normally I would filter movie showings by show dates, so user could choose a day that interests him
- [ ] Implement data loaders to avoid N+1 queries.
- [ ] Modify inflectors to be able to use constants like `GraphQL`
- [ ] I have implemented only integration tests. I would work for 100% code coverage
