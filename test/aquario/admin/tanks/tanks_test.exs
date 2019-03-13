defmodule Aquario.Admin.TanksTest do
  use Aquario.DataCase

  alias Aquario.Admin.Tanks

  describe "tanks" do
    alias Aquario.Admin.Tanks.Tank

    @valid_attrs %{description_en_us: "some description_en_us", description_es_es: "some description_es_es", description_pt_br: "some description_pt_br", image: "some image", link_audio: "some link_audio", link_libras: "some link_libras", name_en_us: "some name_en_us", name_es_es: "some name_es_es", name_pt_br: "some name_pt_br", order: 42, title_en_us: "some title_en_us", title_es_es: "some title_es_es", title_pt_br: "some title_pt_br"}
    @update_attrs %{description_en_us: "some updated description_en_us", description_es_es: "some updated description_es_es", description_pt_br: "some updated description_pt_br", image: "some updated image", link_audio: "some updated link_audio", link_libras: "some updated link_libras", name_en_us: "some updated name_en_us", name_es_es: "some updated name_es_es", name_pt_br: "some updated name_pt_br", order: 43, title_en_us: "some updated title_en_us", title_es_es: "some updated title_es_es", title_pt_br: "some updated title_pt_br"}
    @invalid_attrs %{description_en_us: nil, description_es_es: nil, description_pt_br: nil, image: nil, link_audio: nil, link_libras: nil, name_en_us: nil, name_es_es: nil, name_pt_br: nil, order: nil, title_en_us: nil, title_es_es: nil, title_pt_br: nil}

    def tank_fixture(attrs \\ %{}) do
      {:ok, tank} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.Tanks.create_tank()

      tank
    end

    test "list_tanks/0 returns all tanks" do
      tank = tank_fixture()
      assert Admin.Tanks.list_tanks() == [tank]
    end

    test "get_tank!/1 returns the tank with given id" do
      tank = tank_fixture()
      assert Admin.Tanks.get_tank!(tank.id) == tank
    end

    test "create_tank/1 with valid data creates a tank" do
      assert {:ok, %Tank{} = tank} = Admin.Tanks.create_tank(@valid_attrs)
      assert tank.description_en_us == "some description_en_us"
      assert tank.description_es_es == "some description_es_es"
      assert tank.description_pt_br == "some description_pt_br"
      assert tank.image == "some image"
      assert tank.link_audio == "some link_audio"
      assert tank.link_libras == "some link_libras"
      assert tank.name_en_us == "some name_en_us"
      assert tank.name_es_es == "some name_es_es"
      assert tank.name_pt_br == "some name_pt_br"
      assert tank.order == 42
      assert tank.title_en_us == "some title_en_us"
      assert tank.title_es_es == "some title_es_es"
      assert tank.title_pt_br == "some title_pt_br"
    end

    test "create_tank/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.Tanks.create_tank(@invalid_attrs)
    end

    test "update_tank/2 with valid data updates the tank" do
      tank = tank_fixture()
      assert {:ok, tank} = Admin.Tanks.update_tank(tank, @update_attrs)
      assert %Tank{} = tank
      assert tank.description_en_us == "some updated description_en_us"
      assert tank.description_es_es == "some updated description_es_es"
      assert tank.description_pt_br == "some updated description_pt_br"
      assert tank.image == "some updated image"
      assert tank.link_audio == "some updated link_audio"
      assert tank.link_libras == "some updated link_libras"
      assert tank.name_en_us == "some updated name_en_us"
      assert tank.name_es_es == "some updated name_es_es"
      assert tank.name_pt_br == "some updated name_pt_br"
      assert tank.order == 43
      assert tank.title_en_us == "some updated title_en_us"
      assert tank.title_es_es == "some updated title_es_es"
      assert tank.title_pt_br == "some updated title_pt_br"
    end

    test "update_tank/2 with invalid data returns error changeset" do
      tank = tank_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.Tanks.update_tank(tank, @invalid_attrs)
      assert tank == Admin.Tanks.get_tank!(tank.id)
    end

    test "delete_tank/1 deletes the tank" do
      tank = tank_fixture()
      assert {:ok, %Tank{}} = Admin.Tanks.delete_tank(tank)
      assert_raise Ecto.NoResultsError, fn -> Admin.Tanks.get_tank!(tank.id) end
    end

    test "change_tank/1 returns a tank changeset" do
      tank = tank_fixture()
      assert %Ecto.Changeset{} = Admin.Tanks.change_tank(tank)
    end
  end
end
