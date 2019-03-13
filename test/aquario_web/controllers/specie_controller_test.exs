defmodule AquarioWeb.SpecieControllerTest do
  use AquarioWeb.ConnCase

  alias Aquario.Species

  @create_attrs %{description_en_us: "some description_en_us", description_es_es: "some description_es_es", description_pt_br: "some description_pt_br", image: "some image", name_en_us: "some name_en_us", name_es_es: "some name_es_es", name_pt_br: "some name_pt_br", order: 42, scientific_name_en_us: "some scientific_name_en_us", scientific_name_es_es: "some scientific_name_es_es", scientific_name_pt_br: "some scientific_name_pt_br", title_en_us: "some title_en_us", title_es_es: "some title_es_es", title_pt_br: "some title_pt_br"}
  @update_attrs %{description_en_us: "some updated description_en_us", description_es_es: "some updated description_es_es", description_pt_br: "some updated description_pt_br", image: "some updated image", name_en_us: "some updated name_en_us", name_es_es: "some updated name_es_es", name_pt_br: "some updated name_pt_br", order: 43, scientific_name_en_us: "some updated scientific_name_en_us", scientific_name_es_es: "some updated scientific_name_es_es", scientific_name_pt_br: "some updated scientific_name_pt_br", title_en_us: "some updated title_en_us", title_es_es: "some updated title_es_es", title_pt_br: "some updated title_pt_br"}
  @invalid_attrs %{description_en_us: nil, description_es_es: nil, description_pt_br: nil, image: nil, name_en_us: nil, name_es_es: nil, name_pt_br: nil, order: nil, scientific_name_en_us: nil, scientific_name_es_es: nil, scientific_name_pt_br: nil, title_en_us: nil, title_es_es: nil, title_pt_br: nil}

  def fixture(:specie) do
    {:ok, specie} = Species.create_specie(@create_attrs)
    specie
  end

  describe "index" do
    test "lists all species", %{conn: conn} do
      conn = get conn, specie_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Species"
    end
  end

  describe "new specie" do
    test "renders form", %{conn: conn} do
      conn = get conn, specie_path(conn, :new)
      assert html_response(conn, 200) =~ "New Specie"
    end
  end

  describe "create specie" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, specie_path(conn, :create), specie: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == specie_path(conn, :show, id)

      conn = get conn, specie_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Specie"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, specie_path(conn, :create), specie: @invalid_attrs
      assert html_response(conn, 200) =~ "New Specie"
    end
  end

  describe "edit specie" do
    setup [:create_specie]

    test "renders form for editing chosen specie", %{conn: conn, specie: specie} do
      conn = get conn, specie_path(conn, :edit, specie)
      assert html_response(conn, 200) =~ "Edit Specie"
    end
  end

  describe "update specie" do
    setup [:create_specie]

    test "redirects when data is valid", %{conn: conn, specie: specie} do
      conn = put conn, specie_path(conn, :update, specie), specie: @update_attrs
      assert redirected_to(conn) == specie_path(conn, :show, specie)

      conn = get conn, specie_path(conn, :show, specie)
      assert html_response(conn, 200) =~ "some updated description_en_us"
    end

    test "renders errors when data is invalid", %{conn: conn, specie: specie} do
      conn = put conn, specie_path(conn, :update, specie), specie: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Specie"
    end
  end

  describe "delete specie" do
    setup [:create_specie]

    test "deletes chosen specie", %{conn: conn, specie: specie} do
      conn = delete conn, specie_path(conn, :delete, specie)
      assert redirected_to(conn) == specie_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, specie_path(conn, :show, specie)
      end
    end
  end

  defp create_specie(_) do
    specie = fixture(:specie)
    {:ok, specie: specie}
  end
end
