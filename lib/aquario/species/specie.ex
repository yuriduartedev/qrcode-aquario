defmodule Aquario.Species.Specie do
  use Ecto.Schema
  import Ecto.Changeset


  schema "species" do
    field :description_en_us, :string
    field :description_es_es, :string
    field :description_pt_br, :string
    field :image, :string
    field :name_en_us, :string
    field :name_es_es, :string
    field :name_pt_br, :string
    field :order, :integer
    field :scientific_name_en_us, :string
    field :scientific_name_es_es, :string
    field :scientific_name_pt_br, :string
    field :title_en_us, :string
    field :title_es_es, :string
    field :title_pt_br, :string

    timestamps()
  end

  @doc false
  def changeset(specie, attrs) do
    specie
    |> cast(attrs, [:name_pt_br, :name_en_us, :name_es_es, :scientific_name_pt_br, :scientific_name_en_us, :scientific_name_es_es, :order, :image, :description_pt_br, :description_en_us, :description_es_es, :title_pt_br, :title_en_us, :title_es_es])
    |> validate_required([:name_pt_br, :name_en_us, :name_es_es, :scientific_name_pt_br, :scientific_name_en_us, :scientific_name_es_es, :order, :image, :description_pt_br, :description_en_us, :description_es_es, :title_pt_br, :title_en_us, :title_es_es])
  end
end
