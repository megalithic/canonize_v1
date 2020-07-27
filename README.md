## Canon

Taking your various social media bookmarks and favorites and aggregating them into one searchable, filterable location. Perhaps even support Zapier or IFTTT.


#### Supports

- [ ] Instagram (saved)
  * https://www.instagram.com/developer/clients/manage/
- [ ] Twitter (liked)
  * https://developer.twitter.com/en/docs/api-reference-index
    * https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/get-favorites-list
    * https://api.twitter.com/1.1/favorites/list.json?count=200&screen_name=megalithic
  * `{TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET}`
- [ ] Facebook (saved)
- [ ] Slack (starred)
- [ ] Reddit (saved)
  * https://www.reddit.com/dev/api
    * https://www.reddit.com/dev/api#POST_api_save
- [ ] GitHub (starred)
- [ ] YouTube (watch later)
- [ ] Gmail (starred)


#### Features

- [x] Login via API
- [ ] User-configurable API credentials
- [ ] Searchable
- [ ] Filterable
- [ ] Offline-friendly (PWA)
- [ ] Taggable
- [ ] Add notes/metadata
- [ ] Mobile-friendly


#### Technologies

* Elixir
* Phoenix (LiveView)
* Postgres
* GraphQL

#### TODO

- Switch to `gun` from `mint` for http things? More focus on
  concurrence/processes than stateless http client instances.

#### Additional Info

- https://github.com/APIs-guru/graphql-apis

---

#### Default Phoenix things

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

##### Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
