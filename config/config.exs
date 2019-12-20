# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hopper,
  ecto_repos: [Hopper.Repo]

# Configures the endpoint
config :hopper, HopperWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "rhcYFpljcZVGyxV9Jt4h9tsx9Tp1CKTms5al2haHI6S+53cS+uS7doCREuDmsoXl",
  render_errors: [view: HopperWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Hopper.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
