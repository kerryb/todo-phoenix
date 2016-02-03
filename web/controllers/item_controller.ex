defmodule TodoPhoenix_2.ItemController do
  use TodoPhoenix_2.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
