use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todo_phoenix_2, TodoPhoenix_2.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :hound, driver: "phantomjs"

alias Dogma.Rule

config :dogma,
  rule_set: Dogma.RuleSet.All,

  exclude: [
    ~r(\Alib/vendor/),
  ],

  override: %{
    LineLength => [max_length: 120],
    ModuleDoc => false,
    ModuleName => false,
  }

import_config "test.database.exs"
