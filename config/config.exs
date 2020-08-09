# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :canonize,
  ecto_repos: [Canonize.Repo]

# Configures the endpoint
config :canonize, CanonizeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3tQh4PHHFySOiZ6cAwtFrVJSV5IfAm0MHSx5tjFyp/RWcqWffgk0fO76u79yL3tk",
  render_errors: [view: CanonizeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Canonize.PubSub,
  live_view: [signing_salt: "NIArdp0E"]

# :type in services schema
config :canonize, :supported_services, [
  :reddit,
  :github,
  :twitter,
  :youtube,
  :instagram,
  :facebook,
  :slack
]

config :canonize, :services,
  reddit: %{url: "https://www.reddit.com", client_id: "", client_secret: "", redirect_uri: ""},
  twitter: %{url: "https://api.twitter.com", client_id: "", client_secret: ""},
  github: %{
    url: "https://api.github.com",
    client_id: "",
    client_secret: "",
    username: "megalithic"
  }

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
