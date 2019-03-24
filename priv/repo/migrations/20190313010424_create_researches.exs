defmodule Aquario.Repo.Migrations.CreateResearches do
  use Ecto.Migration

  def change do
    create table(:researches) do
      add :title_pt_br, :string
      add :title_en_us, :string
      add :title_es_es, :string
      add :image, :string
      add :description_pt_br, :text
      add :description_en_us, :text
      add :description_es_es, :text
      add :author, {:array, :string}
      add :link_libras, :string
      add :link_audio, :string
      add :tank_id, references(:tanks, on_delete: :nothing)

      timestamps()
    end

    create index(:researches, [:tank_id])
  end
end
