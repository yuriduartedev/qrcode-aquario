defmodule AquarioWeb.Admin.ResearchView do
  use AquarioWeb, :view
  alias Aquario.Tanks
  alias Aquario.Repo

  def get_tanks, do: Repo.all(Aquario.Tanks.Tank)

  def collection_for_select(items, title) do
    IO.inspect(items)
    Enum.map(items, &({Map.get(&1, title), &1.id}))
  end
end