defmodule TodoPhoenix_2.Mixfile do
  use Mix.Project

  def project do
    [app: :todo_phoenix_2,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     test_coverage: [tool: Coverex.Task],
     preferred_cli_env: [
       dogma: :test,
       espec: :test,
       "white_bread.run": :test,
       tests: :test,
     ],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {TodoPhoenix_2, []},
     applications: applications(Mix.env)]
  end

  defp applications :test do
    applications ++ [:hound]
  end

  defp applications _ do
    applications
  end

  defp applications do
     [:phoenix, :phoenix_html, :cowboy, :logger, :gettext, :phoenix_ecto, :postgrex]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, ">= 0.0.0"},
      {:phoenix_ecto, ">= 0.0.0"},
      {:phoenix_html, ">= 0.0.0"},
      {:phoenix_slim, ">= 0.0.0"},
      {:phoenix_live_reload, ">= 0.0.0", only: :dev},

      {:cowboy, ">= 0.0.0"},
      {:coverex, ">= 0.0.0", only: :test, app: false},
      {:dogma, ">= 0.0.0", only: :test},
      {:espec_phoenix, ">= 0.0.0", only: :test, app: false},
      {:ex_machina, ">= 0.0.0", only: :test, app: false},
      {:gettext, ">= 0.0.0"},
      {:hound, ">= 0.0.0", only: :test},
      {:postgrex, ">= 0.0.0"},
      {:white_bread, ">= 0.0.0", only: :test, app: false},
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "tests": ["dogma", "espec", "white_bread.run"],
    ]
  end
end
