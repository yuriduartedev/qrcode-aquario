defmodule AquarioWeb.Admin.TankView do
  use AquarioWeb, :view

  def specy_selected?(conn, id) do
    species = Aquario.Repo.preload(conn.assigns.changeset.data, :species).species
    ids = (get_in(conn.params, ["tank", "specy_ids"]) || Enum.map(species, &(to_string(&1.id))))

    to_string(id) in ids
  end
end
