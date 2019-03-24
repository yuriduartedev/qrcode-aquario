defmodule Aquario.Repo.Migrations.CreateSpecies do
  use Ecto.Migration

  def change do
    create table(:species) do
      add :name_pt_br, :string
      add :name_en_us, :string
      add :name_es_es, :string
      add :scientific_name_pt_br, :string
      add :scientific_name_en_us, :string
      add :scientific_name_es_es, :string
      add :order, :integer
      add :image, :string
      add :description_pt_br, :text
      add :description_en_us, :text
      add :description_es_es, :text
      add :title_pt_br, :string
      add :title_en_us, :string
      add :title_es_es, :string

      timestamps()
    end

  end
end
