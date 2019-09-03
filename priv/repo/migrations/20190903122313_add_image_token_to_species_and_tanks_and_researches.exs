defmodule Aquario.Repo.Migrations.AddImageTokenToSpeciesAndTanksAndResearches do
  use Ecto.Migration

  def change do
    alter table(:tanks) do
      add :image_token, :string
    end

    alter table(:researches) do
      add :image_token, :string
    end

    alter table(:species) do
      add :image_token, :string
    end
  end
end
