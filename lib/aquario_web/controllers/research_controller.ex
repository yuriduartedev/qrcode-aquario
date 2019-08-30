defmodule AquarioWeb.ResearchController do
  use AquarioWeb, :controller

  alias Aquario.Researches
  alias Aquario.Researches.Research

  def index(conn, _params) do
    researches = Researches.list_researches()
    render(conn, "index.html", researches: researches)
  end

  def show(conn, %{"tank_id" => tank_id}) do
    researches = Researches.list_researches_by_tank_id(tank_id)
    render(conn, "show.html", researches: researches)
  end
end