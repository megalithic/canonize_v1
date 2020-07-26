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
  secret_key_base: "/3QUjbxK2FHfp089rNzIspSKGDRbjK53pxMC04urAfPB55fyetYAe4KWOKi8Z8BF",
  render_errors: [view: CanonizeWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Canonize.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
