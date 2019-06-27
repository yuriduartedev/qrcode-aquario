defmodule Aquario.Researches.Research do
  use Ecto.Schema
  import Ecto.Changeset


  schema "researches" do
    field :author, {:array, :jsonb}
    field :description_en_us, :string
    field :description_es_es, :string
    field :description_pt_br, :string
    field :image, :string
    field :link_audio, :string
    field :link_libras, :string
    field :title_en_us, :string
    field :title_es_es, :string
    field :title_pt_br, :string
    field :tank_id, :id

    timestamps()
  end

  @doc false
  def changeset(research, attrs) do
    research
    |> cast(attrs, [:title_pt_br, :title_en_us, :title_es_es, :image, :description_pt_br, :description_en_us, :description_es_es, :author, :link_libras, :link_audio])
    |> validate_required([:title_pt_br, :title_en_us, :title_es_es, :image, :description_pt_br, :description_en_us, :description_es_es, :author, :link_libras, :link_audio])
  end
end
