Code.require_file "spec/phoenix_helper.exs"

ESpec.start

ESpec.configure fn(config) ->
  config.before fn ->
    Ecto.Adapters.SQL.restart_test_transaction TodoPhoenix_2.Repo, []
  end

  config.finally fn(shared) ->
  end
end
