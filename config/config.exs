# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sticky_notes_app,
  ecto_repos: [StickyNotesApp.Repo]

# Configures the endpoint
config :sticky_notes_app, StickyNotesAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p9F5lzvf8D0ycex03/ZOw9vqhLdJ+hq9naA0cA4ojHK1m1wpDIUKRUe0GReZ+cvg",
  render_errors: [view: StickyNotesAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: StickyNotesApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Add Drab's template engine
config :phoenix, :template_engines,
  drab: Drab.Live.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
