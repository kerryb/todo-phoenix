defmodule TodoPhoenix_2.ItemController do
  use TodoPhoenix_2.Web, :controller

  def index(conn, _params) do
    items = Repo.all TodoPhoenix_2.Item
    render conn, "index.html", items: items
  end
end
