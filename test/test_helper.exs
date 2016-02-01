ExUnit.start

Mix.Task.run "ecto.create", ~w(-r TodoPhoenix_2.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r TodoPhoenix_2.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(TodoPhoenix_2.Repo)

