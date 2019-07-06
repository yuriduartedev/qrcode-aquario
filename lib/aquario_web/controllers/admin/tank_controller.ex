defmodule AquarioWeb.Admin.TankController do
  use AquarioWeb, :controller

  alias Aquario.Tanks
  alias Aquario.Tanks.Tank
  alias Aquario.Species
  
  plug :load_species when action in [:new, :create, :edit, :update]  

  def index(conn, _params) do
    tanks = Tanks.list_tanks()
    render(conn, "index.html", tanks: tanks)
  end

  def new(conn, _params) do
    changeset = Tanks.change_tank(%Tank{})
    
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tank" => tank_params}) do
    case Tanks.create_tank(tank_params) do
      {:ok, tank} ->
        conn
        |> put_flash(:info, "Tank created successfully.")
        |> redirect(to: admin_tank_path(conn, :show, tank))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tank = Tanks.get_tank!(id)
    render(conn, "show.html", tank: tank)
  end

  def edit(conn, %{"id" => id}) do
    tank = Tanks.get_tank!(id)
    changeset = Tanks.change_tank(tank)
    render(conn, "edit.html", tank: tank, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tank" => tank_params}) do
    tank = Tanks.get_tank!(id)

    case Tanks.update_tank(tank, tank_params) do
      {:ok, tank} ->
        conn
        |> put_flash(:info, "Tank updated successfully.")
        |> redirect(to: admin_tank_path(conn, :show, tank))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tank: tank, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tank = Tanks.get_tank!(id)
    {:ok, _tank} = Tanks.delete_tank(tank)

    conn
    |> put_flash(:info, "Tank deleted successfully.")
    |> redirect(to: admin_tank_path(conn, :index))
  end

  defp load_species(conn, _opts) do
    assign(conn, :species, Species.list_species)
  end
end
