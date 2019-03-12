defmodule AquarioWeb.PageController do
  use AquarioWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
