defmodule AquarioWeb.ResearchController do
  use AquarioWeb, :controller

  alias Aquario.Researches
  alias Aquario.Researches.Research

  def index(conn, _params) do
    researches = Researches.list_researches()
    render(conn, "index.html", researches: researches)
  end

  def show do
    
  end

end