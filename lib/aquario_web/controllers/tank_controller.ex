defmodule AquarioWeb.TankController do
  use AquarioWeb, :controller
  import Ecto.Query
  
  alias Aquario.Repo
  alias Aquario.Tanks
  alias Aquario.Tanks.Tank

  def index(conn, _params) do
    query = from(t in Tank, order_by: t.order)
    tanks = Repo.all(query)
    ordered(query)
    render(conn, "index.html", tanks: tanks)
  end

  def show(conn, %{"id" => "1"}) do
    redirect(conn, external: "https://www.huggy.chat/bb215e48-ed16-453d-8661-61cae8af811f")
  end

  def show(conn, %{"id" => id}) do
    tank =
      id
      |> Tanks.get_tank!()
      |> Repo.preload([:species, :researches])
    render(conn, "show.html", tank: tank)
  end

  defp ordered(query) do
    from t in query,
    order_by: t.order
  end
end