defmodule AquarioWeb.Admin.SpecyController do
  use AquarioWeb, :controller
  import Ecto.Query
  
  alias Aquario.Repo
  alias Aquario.Species
  alias Aquario.Species.Specy

  def index(conn, _params) do    
    query = from(s in Specy, order_by: s.order)
    species = Repo.all(query)
    ordered(query)
    render(conn, "index.html", species: species)
  end

  def new(conn, _params) do
    changeset = Species.change_specy(%Specy{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"specy" => specy_params}) do
    case Species.create_specy(specy_params) do
      {:ok, specy} ->
        conn
        |> put_flash(:info, "Specy created successfully.")
        |> redirect(to: admin_specy_path(conn, :show, specy))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    specy = Species.get_specy!(id)
    render(conn, "show.html", specy: specy)
  end

  def edit(conn, %{"id" => id}) do
    specy = Species.get_specy!(id)
    changeset = Species.change_specy(specy)
    render(conn, "edit.html", specy: specy, changeset: changeset)
  end

  def update(conn, %{"id" => id, "specy" => specy_params}) do
    specy = Species.get_specy!(id)

    case Species.update_specy(specy, specy_params) do
      {:ok, specy} ->
        conn
        |> put_flash(:info, "Specy updated successfully.")
        |> redirect(to: admin_specy_path(conn, :show, specy))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", specy: specy, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    specy = Species.get_specy!(id)
    {:ok, _specy} = Species.delete_specy(specy)

    conn
    |> put_flash(:info, "Specy deleted successfully.")
    |> redirect(to: admin_specy_path(conn, :index))
  end

  defp ordered(query) do
    from s in query,
    order_by: s.order
  end
end
