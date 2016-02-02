defmodule TodoPhoenix_2.Factory do
  use ExMachina.Ecto, repo: TodoPhoenix_2.Repo
  alias TodoPhoenix_2.Item

  def factory(:item) do
    %Item{
      text: "Do all the things!",
    }
  end
end
