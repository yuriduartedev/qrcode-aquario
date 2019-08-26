defmodule Aquario.Tanks.Tank do
  use Ecto.Schema  
  use Arc.Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias Aquario.Researches.Research
  alias AquarioWeb.PhotoUploader
  alias Aquario.Species.Specy
  alias Aquario.Repo

  schema "tanks" do
    many_to_many :species, Specy,
      join_through: "species_tanks",
      on_delete: :delete_all,
      on_replace: :delete

    has_many :researches, Research

    field :description_en_us, :string
    field :description_es_es, :string
    field :description_pt_br, :string
    field :image, PhotoUploader.Type
    field :link_audio, :string
    field :link_libras, :string
    field :name_en_us, :string
    field :name_es_es, :string
    field :name_pt_br, :string
    field :order, :integer
    field :title_en_us, :string
    field :title_es_es, :string
    field :title_pt_br, :string

    timestamps()
  end

  @doc false
  def changeset(tank, attrs) do
    tank
    |> Repo.preload(:species)    
    |> cast(attrs, [:name_pt_br, :name_en_us, :name_es_es, :order, :image, :description_pt_br, :description_en_us, :description_es_es, :title_pt_br, :title_en_us, :title_es_es, :link_libras, :link_audio])
    |> put_change(:image_token, Ecto.UUID.generate())
    |> cast_attachments(attrs, [:image])
    |> validate_required([:name_pt_br, :description_pt_br, :title_pt_br])
    |> put_assoc(:species, parse_species(attrs))
    |> validate_length(:species, min: 0)
  end

  defp parse_species(attrs)  do
    ids = attrs |> Map.get("specy_ids", []) |> Enum.map(&String.to_integer/1)

    Specy
    |> where([d], d.id in ^ids)
    |> Repo.all()
  end
end
