# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :repack_reminder,
  ecto_repos: [RepackReminder.Repo]

# Configures the endpoint
config :repack_reminder, RepackReminder.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dNq/VoYHussuIIR7JQ4+ima5f5N3/brOE0boHQaw9UZZr2wAfyP/Th/P4At2ejgd",
  render_errors: [view: RepackReminder.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RepackReminder.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :repack_reminder, RepackReminder.Mailer,
  adapter: Bamboo.SendgridAdapter,
  api_key: System.get_env("SENDGRID_API_KEY")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
