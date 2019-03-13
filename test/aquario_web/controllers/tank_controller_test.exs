defmodule AquarioWeb.TankControllerTest do
  use AquarioWeb.ConnCase

  alias Aquario.Admin.Tanks

  @create_attrs %{description_en_us: "some description_en_us", description_es_es: "some description_es_es", description_pt_br: "some description_pt_br", image: "some image", link_audio: "some link_audio", link_libras: "some link_libras", name_en_us: "some name_en_us", name_es_es: "some name_es_es", name_pt_br: "some name_pt_br", order: 42, title_en_us: "some title_en_us", title_es_es: "some title_es_es", title_pt_br: "some title_pt_br"}
  @update_attrs %{description_en_us: "some updated description_en_us", description_es_es: "some updated description_es_es", description_pt_br: "some updated description_pt_br", image: "some updated image", link_audio: "some updated link_audio", link_libras: "some updated link_libras", name_en_us: "some updated name_en_us", name_es_es: "some updated name_es_es", name_pt_br: "some updated name_pt_br", order: 43, title_en_us: "some updated title_en_us", title_es_es: "some updated title_es_es", title_pt_br: "some updated title_pt_br"}
  @invalid_attrs %{description_en_us: nil, description_es_es: nil, description_pt_br: nil, image: nil, link_audio: nil, link_libras: nil, name_en_us: nil, name_es_es: nil, name_pt_br: nil, order: nil, title_en_us: nil, title_es_es: nil, title_pt_br: nil}

  def fixture(:tank) do
    {:ok, tank} = Admin.Tanks.create_tank(@create_attrs)
    tank
  end

  describe "index" do
    test "lists all tanks", %{conn: conn} do
      conn = get conn, tank_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Tanks"
    end
  end

  describe "new tank" do
    test "renders form", %{conn: conn} do
      conn = get conn, tank_path(conn, :new)
      assert html_response(conn, 200) =~ "New Tank"
    end
  end

  describe "create tank" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, tank_path(conn, :create), tank: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == tank_path(conn, :show, id)

      conn = get conn, tank_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Tank"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tank_path(conn, :create), tank: @invalid_attrs
      assert html_response(conn, 200) =~ "New Tank"
    end
  end

  describe "edit tank" do
    setup [:create_tank]

    test "renders form for editing chosen tank", %{conn: conn, tank: tank} do
      conn = get conn, tank_path(conn, :edit, tank)
      assert html_response(conn, 200) =~ "Edit Tank"
    end
  end

  describe "update tank" do
    setup [:create_tank]

    test "redirects when data is valid", %{conn: conn, tank: tank} do
      conn = put conn, tank_path(conn, :update, tank), tank: @update_attrs
      assert redirected_to(conn) == tank_path(conn, :show, tank)

      conn = get conn, tank_path(conn, :show, tank)
      assert html_response(conn, 200) =~ "some updated description_en_us"
    end

    test "renders errors when data is invalid", %{conn: conn, tank: tank} do
      conn = put conn, tank_path(conn, :update, tank), tank: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Tank"
    end
  end

  describe "delete tank" do
    setup [:create_tank]

    test "deletes chosen tank", %{conn: conn, tank: tank} do
      conn = delete conn, tank_path(conn, :delete, tank)
      assert redirected_to(conn) == tank_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, tank_path(conn, :show, tank)
      end
    end
  end

  defp create_tank(_) do
    tank = fixture(:tank)
    {:ok, tank: tank}
  end
end
