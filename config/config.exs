# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :aquario,
  ecto_repos: [Aquario.Repo]

# Configures the endpoint
config :aquario, AquarioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mHMTW/4zQb4UOG1Esc5IAIDQCimXF5B0YHCUWK6baUmhmBi50BG45PsJe3da7tIg",
  render_errors: [view: AquarioWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Aquario.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Gettext
config :gettext, :default_locale, "pt_BR"

# Arc
config :arc,
  storage: Arc.Storage.Local,
  storage_dir: "tmp/uploads"

# Basic Auth
config :aquario, aquario_auth: [
  username: "aqua",
  password: "educacao",
  realm: "Admin Area"
]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"