defmodule AquarioWeb.Admin.ResearchController do
  use AquarioWeb, :controller

  alias Aquario.Researches
  alias Aquario.Researches.Research

  def index(conn, _params) do
    researches = Researches.list_researches()
    render(conn, "index.html", researches: researches)
  end

  def new(conn, _params) do
    changeset = Researches.change_research(%Research{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"research" => research_params}) do
    case Researches.create_research(research_params) do
      {:ok, research} ->
        conn
        |> put_flash(:info, "Research created successfully.")
        |> redirect(to: admin_research_path(conn, :show, research))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    research = Researches.get_research!(id)
    render(conn, "show.html", research: research)
  end

  def edit(conn, %{"id" => id}) do
    research = Researches.get_research!(id)
    changeset = Researches.change_research(research)
    render(conn, "edit.html", research: research, changeset: changeset)
  end

  def update(conn, %{"id" => id, "research" => research_params}) do
    research = Researches.get_research!(id)

    case Researches.update_research(research, research_params) do
      {:ok, research} ->
        conn
        |> put_flash(:info, "Research updated successfully.")
        |> redirect(to: admin_research_path(conn, :show, research))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", research: research, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    research = Researches.get_research!(id)
    {:ok, _research} = Researches.delete_research(research)

    conn
    |> put_flash(:info, "Research deleted successfully.")
    |> redirect(to: admin_research_path(conn, :index))
  end
end
