defmodule SunDoe.CoffeeShopContext do
  use WhiteBread.Context
  import TodoPhoenix_2.Factory
  alias TodoPhoenix_2.Repo
  alias TodoPhoenix_2.Item

  feature_starting_state fn  ->
    %{}
  end

  scenario_starting_state fn state ->
    Ecto.Adapters.SQL.begin_test_transaction(Repo)
    state
  end

  scenario_finalize fn state ->
    Ecto.Adapters.SQL.rollback_test_transaction(Repo)
    state
  end

  given_ ~r/^I have some TODO items$/, fn state ->
    create :item, text: "Do a thing"
    {:ok, state}
  end

  when_ ~r/^I view my TODO list$/, fn state ->
    # Bypass the web app for now
    {:ok, state}
  end

  then_ ~r/^I can see the items$/, fn state ->
    item = Repo.one Item
    assert item.text == "Do a thing"
    {:ok, state}
  end
end
