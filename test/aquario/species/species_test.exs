defmodule Aquario.SpeciesTest do
  use Aquario.DataCase

  alias Aquario.Species

  describe "species" do
    alias Aquario.Species.Specie

    @valid_attrs %{description_en_us: "some description_en_us", description_es_es: "some description_es_es", description_pt_br: "some description_pt_br", image: "some image", name_en_us: "some name_en_us", name_es_es: "some name_es_es", name_pt_br: "some name_pt_br", order: 42, scientific_name_en_us: "some scientific_name_en_us", scientific_name_es_es: "some scientific_name_es_es", scientific_name_pt_br: "some scientific_name_pt_br", title_en_us: "some title_en_us", title_es_es: "some title_es_es", title_pt_br: "some title_pt_br"}
    @update_attrs %{description_en_us: "some updated description_en_us", description_es_es: "some updated description_es_es", description_pt_br: "some updated description_pt_br", image: "some updated image", name_en_us: "some updated name_en_us", name_es_es: "some updated name_es_es", name_pt_br: "some updated name_pt_br", order: 43, scientific_name_en_us: "some updated scientific_name_en_us", scientific_name_es_es: "some updated scientific_name_es_es", scientific_name_pt_br: "some updated scientific_name_pt_br", title_en_us: "some updated title_en_us", title_es_es: "some updated title_es_es", title_pt_br: "some updated title_pt_br"}
    @invalid_attrs %{description_en_us: nil, description_es_es: nil, description_pt_br: nil, image: nil, name_en_us: nil, name_es_es: nil, name_pt_br: nil, order: nil, scientific_name_en_us: nil, scientific_name_es_es: nil, scientific_name_pt_br: nil, title_en_us: nil, title_es_es: nil, title_pt_br: nil}

    def specie_fixture(attrs \\ %{}) do
      {:ok, specie} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Species.create_specie()

      specie
    end

    test "list_species/0 returns all species" do
      specie = specie_fixture()
      assert Species.list_species() == [specie]
    end

    test "get_specie!/1 returns the specie with given id" do
      specie = specie_fixture()
      assert Species.get_specie!(specie.id) == specie
    end

    test "create_specie/1 with valid data creates a specie" do
      assert {:ok, %Specie{} = specie} = Species.create_specie(@valid_attrs)
      assert specie.description_en_us == "some description_en_us"
      assert specie.description_es_es == "some description_es_es"
      assert specie.description_pt_br == "some description_pt_br"
      assert specie.image == "some image"
      assert specie.name_en_us == "some name_en_us"
      assert specie.name_es_es == "some name_es_es"
      assert specie.name_pt_br == "some name_pt_br"
      assert specie.order == 42
      assert specie.scientific_name_en_us == "some scientific_name_en_us"
      assert specie.scientific_name_es_es == "some scientific_name_es_es"
      assert specie.scientific_name_pt_br == "some scientific_name_pt_br"
      assert specie.title_en_us == "some title_en_us"
      assert specie.title_es_es == "some title_es_es"
      assert specie.title_pt_br == "some title_pt_br"
    end

    test "create_specie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Species.create_specie(@invalid_attrs)
    end

    test "update_specie/2 with valid data updates the specie" do
      specie = specie_fixture()
      assert {:ok, specie} = Species.update_specie(specie, @update_attrs)
      assert %Specie{} = specie
      assert specie.description_en_us == "some updated description_en_us"
      assert specie.description_es_es == "some updated description_es_es"
      assert specie.description_pt_br == "some updated description_pt_br"
      assert specie.image == "some updated image"
      assert specie.name_en_us == "some updated name_en_us"
      assert specie.name_es_es == "some updated name_es_es"
      assert specie.name_pt_br == "some updated name_pt_br"
      assert specie.order == 43
      assert specie.scientific_name_en_us == "some updated scientific_name_en_us"
      assert specie.scientific_name_es_es == "some updated scientific_name_es_es"
      assert specie.scientific_name_pt_br == "some updated scientific_name_pt_br"
      assert specie.title_en_us == "some updated title_en_us"
      assert specie.title_es_es == "some updated title_es_es"
      assert specie.title_pt_br == "some updated title_pt_br"
    end

    test "update_specie/2 with invalid data returns error changeset" do
      specie = specie_fixture()
      assert {:error, %Ecto.Changeset{}} = Species.update_specie(specie, @invalid_attrs)
      assert specie == Species.get_specie!(specie.id)
    end

    test "delete_specie/1 deletes the specie" do
      specie = specie_fixture()
      assert {:ok, %Specie{}} = Species.delete_specie(specie)
      assert_raise Ecto.NoResultsError, fn -> Species.get_specie!(specie.id) end
    end

    test "change_specie/1 returns a specie changeset" do
      specie = specie_fixture()
      assert %Ecto.Changeset{} = Species.change_specie(specie)
    end
  end
end
