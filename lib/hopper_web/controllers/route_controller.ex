defmodule HopperWeb.RouteController do
  use HopperWeb, :controller

  alias Hopper.Rides

  def index(conn, _params) do
    routes = Rides.list_routes()

    conn
    |> put_status(:ok)
    |> render("index.json", routes: routes)
  end

  def show(conn, %{"id" => id}) do
    case Rides.get_route(id) do
      {:ok, route} ->
        conn
        |> put_status(:ok)
        |> render("show.json", route: route)

      {:error, 404} ->
        conn
        |> put_status(:not_found)
        |> text("Not Found")
    end
  end

  def create(conn, %{"route" => route}) do
    case Rides.create_route(route) do
      {:ok, route} ->
        conn
        |> put_status(:ok)
        |> render("show.json", route: route)

      {:error, _} ->
        conn
        |> put_status(:bad_request)
        |> text("Bad Request")
    end
  end

  def update(conn, %{"route" => route, "id" => id}) do
    case Rides.update_route(id, route) do
      {:ok, route} ->
        conn
        |> put_status(:ok)
        |> render("show.json", route: route)

      {:error, _} ->
        conn
        |> put_status(:bad_request)
        |> text("Bad Request")
    end
  end

  def delete(conn, %{"id" => id}) do
    case Rides.delete_route(id) do
      :ok ->
        conn
        |> put_status(:ok)
        |> text("Ride Deleted")

      {:error, 404} ->
        conn
        |> put_status(:not_found)
        |> text("Not Found")
    end
  end
end
