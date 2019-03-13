defmodule Aquario.ResearchesTest do
  use Aquario.DataCase

  alias Aquario.Researches

  describe "researches" do
    alias Aquario.Researches.Research

    @valid_attrs %{author: [], description_en_us: "some description_en_us", description_es_es: "some description_es_es", description_pt_br: "some description_pt_br", image: "some image", link_audio: "some link_audio", link_libras: "some link_libras", title_en_us: "some title_en_us", title_es_es: "some title_es_es", title_pt_br: "some title_pt_br"}
    @update_attrs %{author: [], description_en_us: "some updated description_en_us", description_es_es: "some updated description_es_es", description_pt_br: "some updated description_pt_br", image: "some updated image", link_audio: "some updated link_audio", link_libras: "some updated link_libras", title_en_us: "some updated title_en_us", title_es_es: "some updated title_es_es", title_pt_br: "some updated title_pt_br"}
    @invalid_attrs %{author: nil, description_en_us: nil, description_es_es: nil, description_pt_br: nil, image: nil, link_audio: nil, link_libras: nil, title_en_us: nil, title_es_es: nil, title_pt_br: nil}

    def research_fixture(attrs \\ %{}) do
      {:ok, research} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Researches.create_research()

      research
    end

    test "list_researches/0 returns all researches" do
      research = research_fixture()
      assert Researches.list_researches() == [research]
    end

    test "get_research!/1 returns the research with given id" do
      research = research_fixture()
      assert Researches.get_research!(research.id) == research
    end

    test "create_research/1 with valid data creates a research" do
      assert {:ok, %Research{} = research} = Researches.create_research(@valid_attrs)
      assert research.author == []
      assert research.description_en_us == "some description_en_us"
      assert research.description_es_es == "some description_es_es"
      assert research.description_pt_br == "some description_pt_br"
      assert research.image == "some image"
      assert research.link_audio == "some link_audio"
      assert research.link_libras == "some link_libras"
      assert research.title_en_us == "some title_en_us"
      assert research.title_es_es == "some title_es_es"
      assert research.title_pt_br == "some title_pt_br"
    end

    test "create_research/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Researches.create_research(@invalid_attrs)
    end

    test "update_research/2 with valid data updates the research" do
      research = research_fixture()
      assert {:ok, research} = Researches.update_research(research, @update_attrs)
      assert %Research{} = research
      assert research.author == []
      assert research.description_en_us == "some updated description_en_us"
      assert research.description_es_es == "some updated description_es_es"
      assert research.description_pt_br == "some updated description_pt_br"
      assert research.image == "some updated image"
      assert research.link_audio == "some updated link_audio"
      assert research.link_libras == "some updated link_libras"
      assert research.title_en_us == "some updated title_en_us"
      assert research.title_es_es == "some updated title_es_es"
      assert research.title_pt_br == "some updated title_pt_br"
    end

    test "update_research/2 with invalid data returns error changeset" do
      research = research_fixture()
      assert {:error, %Ecto.Changeset{}} = Researches.update_research(research, @invalid_attrs)
      assert research == Researches.get_research!(research.id)
    end

    test "delete_research/1 deletes the research" do
      research = research_fixture()
      assert {:ok, %Research{}} = Researches.delete_research(research)
      assert_raise Ecto.NoResultsError, fn -> Researches.get_research!(research.id) end
    end

    test "change_research/1 returns a research changeset" do
      research = research_fixture()
      assert %Ecto.Changeset{} = Researches.change_research(research)
    end
  end
end
