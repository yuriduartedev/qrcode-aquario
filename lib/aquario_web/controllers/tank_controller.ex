defmodule AquarioWeb.TankController do
  use AquarioWeb, :controller
  
  alias Aquario.Repo
  alias Aquario.Tanks
  alias Aquario.Tanks.Tank

  def index(conn, _params) do    
    tanks = Tanks.list_tanks()    
    render(conn, "index.html", tanks: tanks)
  end

  def show(conn, %{"id" => id}) do
    tank =
      id
      |> Tanks.get_tank!()
      |> Repo.preload(:species)

    render(conn, "show.html", tank: tank)
  end
end