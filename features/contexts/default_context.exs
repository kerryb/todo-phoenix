defmodule SunDoe.CoffeeShopContext do
  use WhiteBread.Context

  feature_starting_state fn  ->
    %{}
  end

  scenario_starting_state fn state ->
    state
  end

  scenario_finalize fn state ->
    state
  end

  given_ ~r/^I have (?<number>\d+) beans$/, fn state, %{number: number} ->
    {:ok, state |> Dict.put(:beans, String.to_integer(number))}
  end

  when_ ~r/^I get another (?<number>\d+) beans$/, fn state, %{number: number} ->
    current_beans = state |> Dict.get(:beans)
    {:ok, state |> Dict.put(:beans, current_beans + String.to_integer(number))}
  end  

  then_ ~r/^I will have (?<number>\d+) beans$/, fn state, %{number: number} ->
    current_beans = state |> Dict.get(:beans)
    assert current_beans == String.to_integer(number)
    {:ok, :ok}
  end
end
