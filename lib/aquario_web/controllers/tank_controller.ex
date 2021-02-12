defmodule AquarioWeb.TankController do
  use AquarioWeb, :controller
  import Ecto.Query
  
  alias Aquario.Repo
  alias Aquario.Tanks
  alias Aquario.Tanks.Tank

  # def index(conn, _params) do
  #   query = from(t in Tank, order_by: t.order)
  #   tanks = Repo.all(query)
  #   ordered(query)
  #   render(conn, "index.html", tanks: tanks)
  # end

  def index(conn, _params) do    
    redirect(conn, external: "https://www.huggy.chat/bb215e48-ed16-453d-8661-61cae8af811f")
  end

  def show(conn, %{"id" => "1"}) do
    redirect(conn, external: "https://www.huggy.chat/bb215e48-ed16-453d-8661-61cae8af811f")
  end

  def show(conn, %{"id" => "4"}) do
    redirect(conn, external: "https://www.huggy.chat/e8fa1c96-7015-41e9-af66-86e55479aa36")
  end

  def show(conn, %{"id" => "5"}) do
    redirect(conn, external: "https://www.huggy.chat/54e2ac14-a450-46af-b69d-8737e9e4ffd2")
  end

  def show(conn, %{"id" => "5"}) do
    redirect(conn, external: "https://www.huggy.chat/54e2ac14-a450-46af-b69d-8737e9e4ffd2")
  end

  def show(conn, %{"id" => "10"}) do
    redirect(conn, external: "https://www.huggy.chat/c43cf434-684b-48fe-a5c8-7f293920970f")
  end

  def show(conn, %{"id" => "11"}) do
    redirect(conn, external: "https://www.huggy.chat/cee785aa-ba0f-4759-9100-780e7561a1a9")
  end

  def show(conn, %{"id" => "12"}) do
    redirect(conn, external: "https://www.huggy.chat/8eeffb18-e23e-4ee3-b3e5-a0047e77ff61")
  end

  def show(conn, %{"id" => "13"}) do
    redirect(conn, external: "https://www.huggy.chat/8b0d1391-4b27-4beb-ac62-0507ac5e80d5")
  end

  def show(conn, %{"id" => "17"}) do
    redirect(conn, external: "https://www.huggy.chat/b363d7fa-1e00-4cd0-94e9-0c05d9b85882")
  end

  def show(conn, %{"id" => "19"}) do
    redirect(conn, external: "https://www.huggy.chat/570e4218-4336-463b-9cc2-f562f3521b7c")
  end

  def show(conn, %{"id" => "20"}) do
    redirect(conn, external: "https://www.huggy.chat/cb149338-94b6-4d79-afc7-514d59a90e2a")
  end

  def show(conn, %{"id" => "26"}) do
    redirect(conn, external: "https://www.huggy.chat/ea12cde4-0dcf-41d0-abcb-cb3b8bc64645")
  end

  def show(conn, %{"id" => _}) do
    redirect(conn, external: "https://www.huggy.chat/b95d9302-eed2-4d9e-9320-ad41ff4516b4")
  end


  # def show(conn, %{"id" => id}) do
  #   tank =
  #     id
  #     |> Tanks.get_tank!()
  #     |> Repo.preload([:species, :researches])
  #   render(conn, "show.html", tank: tank)
  # end

  defp ordered(query) do
    from t in query,
    order_by: t.order
  end
end