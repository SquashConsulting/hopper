defmodule Hopper.RidesTest do
  use Hopper.DataCase

  alias Hopper.Rides

  describe "routes" do
    alias Hopper.Rides.Route

    @valid_attrs %{steps: []}
    @update_attrs %{steps: []}
    @invalid_attrs %{steps: nil}

    def route_fixture(attrs \\ %{}) do
      {:ok, route} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Rides.create_route()

      route
    end

    test "list_routes/0 returns all routes" do
      route = route_fixture()
      assert Rides.list_routes() == [route]
    end

    test "get_route!/1 returns the route with given id" do
      route = route_fixture()
      assert Rides.get_route!(route.id) == route
    end

    test "create_route/1 with valid data creates a route" do
      assert {:ok, %Route{} = route} = Rides.create_route(@valid_attrs)
      assert route.steps == []
    end

    test "create_route/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rides.create_route(@invalid_attrs)
    end

    test "update_route/2 with valid data updates the route" do
      route = route_fixture()
      assert {:ok, %Route{} = route} = Rides.update_route(route, @update_attrs)
      assert route.steps == []
    end

    test "update_route/2 with invalid data returns error changeset" do
      route = route_fixture()
      assert {:error, %Ecto.Changeset{}} = Rides.update_route(route, @invalid_attrs)
      assert route == Rides.get_route!(route.id)
    end

    test "delete_route/1 deletes the route" do
      route = route_fixture()
      assert {:ok, %Route{}} = Rides.delete_route(route)
      assert_raise Ecto.NoResultsError, fn -> Rides.get_route!(route.id) end
    end

    test "change_route/1 returns a route changeset" do
      route = route_fixture()
      assert %Ecto.Changeset{} = Rides.change_route(route)
    end
  end
end
