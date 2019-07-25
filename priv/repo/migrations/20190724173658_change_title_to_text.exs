defmodule Aquario.Repo.Migrations.ChangeTitleToText do
  use Ecto.Migration

  def change do
    alter table(:tanks) do
      modify :title_pt_br, :text
      modify :title_es_es, :text
      modify :title_en_us, :text
    end

    alter table(:researches) do
      modify :title_pt_br, :text
      modify :title_es_es, :text
      modify :title_en_us, :text
    end

    alter table(:species) do
      modify :title_pt_br, :text
      modify :title_es_es, :text
      modify :title_en_us, :text
    end
  end
end
