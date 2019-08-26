defmodule Aquario.Researches.Research do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  alias AquarioWeb.PhotoUploader
  alias Aquario.Tanks.Tank

  schema "researches" do
    field :author, {:array, :string}
    field :description_en_us, :string
    field :description_es_es, :string
    field :description_pt_br, :string
    field :image, PhotoUploader.Type
    field :link_audio, :string
    field :link_libras, :string
    field :title_en_us, :string
    field :title_es_es, :string
    field :title_pt_br, :string

    belongs_to :tank, Tank

    timestamps()
  end

  @doc false
  def changeset(research, attrs) do   
    research
    |> cast(attrs, [:title_pt_br, :title_en_us, :title_es_es, :image, :description_pt_br, :description_en_us, :description_es_es, :link_libras, :link_audio, :tank_id])
    |> put_change(:image_token, Ecto.UUID.generate())
    |> cast_attachments(attrs, [:image])
    |> parse_author()
    |> validate_required([:title_pt_br, :description_pt_br, :tank_id])
    |> IO.inspect()
  end

  defp parse_author(changeset) do
    authors = String.split(changeset.params["author"] || "", ",")

    put_change(changeset, :author, authors)
  end
end
