defmodule Aquario.Repo.Migrations.CreateTanks do
  use Ecto.Migration

  def change do
    create table(:tanks) do
      add :name_pt_br, :string
      add :name_en_us, :string
      add :name_es_es, :string
      add :order, :integer
      add :image, :string
      add :description_pt_br, :string
      add :description_en_us, :string
      add :description_es_es, :string
      add :title_pt_br, :string
      add :title_en_us, :string
      add :title_es_es, :string
      add :link_libras, :string
      add :link_audio, :string

      timestamps()
    end

  end
end
