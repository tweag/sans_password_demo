# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :my_app,
  ecto_repos: [MyApp.Repo]

# Configures the endpoint
config :my_app, MyAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PzJBClur+bPh4ICqV7jhJGC8pAoPa8paASC/HF9MsH5HPYDPBVfp7ynwK8eyfWnV",
  render_errors: [view: MyAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :my_app, MyAppWeb.Guardian,
      issuer: "my_app",
      secret_key: "094QDdNTWzT7rRLEi/H//Txbdm3qv0ylzya4mP0KtwztMaaAAY1Xt53bhHXTEkrQ",
      token_ttl: %{
        "magic" => {30, :minutes},
        "access" => {1, :days}
      }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
