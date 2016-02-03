defmodule TodoPhoenix_2.TodoContext do
  use WhiteBread.Context
  use Hound.Helpers
  import TodoPhoenix_2.Factory
  alias TodoPhoenix_2.Repo
  alias TodoPhoenix_2.Item

  feature_starting_state fn  ->
    endpoint_config =
      Application.get_env(:todo_phoenix_2, TodoPhoenix_2.Endpoint)
      |> Keyword.put(:server, true)
      |> Keyword.put(:port, 4001)
    :ok = Application.put_env(:todo_phoenix_2, TodoPhoenix_2.Endpoint, endpoint_config)
    :ok = Application.stop(:todo_phoenix_2)
    :ok = Application.start(:todo_phoenix_2)
    
    %{}
  end

  scenario_starting_state fn state ->
    Ecto.Adapters.SQL.begin_test_transaction(Repo)
    Hound.start_session
    state
  end

  scenario_finalize fn state ->
    Ecto.Adapters.SQL.rollback_test_transaction(Repo)
    Hound.end_session
    state
  end

  given_ ~r/^I have some TODO items$/, fn state ->
    create :item, text: "Do a thing"
    {:ok, state}
  end

  when_ ~r/^I view my TODO list$/, fn state ->
    navigate_to "/"
    {:ok, state}
  end

  then_ ~r/^I can see the items$/, fn state ->
    item = Repo.one Item
    assert item.text == "Do a thing"
    {:ok, state}
  end
end
