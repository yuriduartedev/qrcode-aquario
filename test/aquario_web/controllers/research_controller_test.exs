defmodule AquarioWeb.ResearchControllerTest do
  use AquarioWeb.ConnCase

  alias Aquario.Researches

  @create_attrs %{author: [], description_en_us: "some description_en_us", description_es_es: "some description_es_es", description_pt_br: "some description_pt_br", image: "some image", link_audio: "some link_audio", link_libras: "some link_libras", title_en_us: "some title_en_us", title_es_es: "some title_es_es", title_pt_br: "some title_pt_br"}
  @update_attrs %{author: [], description_en_us: "some updated description_en_us", description_es_es: "some updated description_es_es", description_pt_br: "some updated description_pt_br", image: "some updated image", link_audio: "some updated link_audio", link_libras: "some updated link_libras", title_en_us: "some updated title_en_us", title_es_es: "some updated title_es_es", title_pt_br: "some updated title_pt_br"}
  @invalid_attrs %{author: nil, description_en_us: nil, description_es_es: nil, description_pt_br: nil, image: nil, link_audio: nil, link_libras: nil, title_en_us: nil, title_es_es: nil, title_pt_br: nil}

  def fixture(:research) do
    {:ok, research} = Researches.create_research(@create_attrs)
    research
  end

  describe "index" do
    test "lists all researches", %{conn: conn} do
      conn = get conn, research_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Researches"
    end
  end

  describe "new research" do
    test "renders form", %{conn: conn} do
      conn = get conn, research_path(conn, :new)
      assert html_response(conn, 200) =~ "New Research"
    end
  end

  describe "create research" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, research_path(conn, :create), research: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == research_path(conn, :show, id)

      conn = get conn, research_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Research"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, research_path(conn, :create), research: @invalid_attrs
      assert html_response(conn, 200) =~ "New Research"
    end
  end

  describe "edit research" do
    setup [:create_research]

    test "renders form for editing chosen research", %{conn: conn, research: research} do
      conn = get conn, research_path(conn, :edit, research)
      assert html_response(conn, 200) =~ "Edit Research"
    end
  end

  describe "update research" do
    setup [:create_research]

    test "redirects when data is valid", %{conn: conn, research: research} do
      conn = put conn, research_path(conn, :update, research), research: @update_attrs
      assert redirected_to(conn) == research_path(conn, :show, research)

      conn = get conn, research_path(conn, :show, research)
      assert html_response(conn, 200) =~ ""
    end

    test "renders errors when data is invalid", %{conn: conn, research: research} do
      conn = put conn, research_path(conn, :update, research), research: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Research"
    end
  end

  describe "delete research" do
    setup [:create_research]

    test "deletes chosen research", %{conn: conn, research: research} do
      conn = delete conn, research_path(conn, :delete, research)
      assert redirected_to(conn) == research_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, research_path(conn, :show, research)
      end
    end
  end

  defp create_research(_) do
    research = fixture(:research)
    {:ok, research: research}
  end
end
