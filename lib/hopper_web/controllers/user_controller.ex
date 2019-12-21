defmodule HopperWeb.UserController do
  use HopperWeb, :controller

  alias Hopper.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()

    conn
    |> put_status(:ok)
    |> render("index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    case Accounts.get_user(id) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("show.json", user: user)

      {:error, 404} ->
        conn
        |> put_status(:not_found)
        |> text("Not Found")
    end
  end

  def create(conn, %{"user" => user}) do
    case Accounts.create_user(user) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("show.json", user: user)

      {:error, _} ->
        conn
        |> put_status(:bad_request)
        |> text("Bad Request")
    end
  end

  def update(conn, %{"user" => user, "id" => id}) do
    case Accounts.update_user(id, user) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("show.json", user: user)

      {:error, _} ->
        conn
        |> put_status(:bad_request)
        |> text("Bad Request")
    end
  end

  def delete(conn, %{"id" => id}) do
    case Accounts.delete_user(id) do
      :ok ->
        conn
        |> put_status(:ok)
        |> text("User Deleted")

      {:error, 404} ->
        conn
        |> put_status(:not_found)
        |> text("Not Found")
    end
  end

  def create_ride(conn, %{"user_id" => user_id, "ride" => ride}) do
    case Accounts.create_ride(user_id, ride) do
      {:ok, user} ->
        conn
        |> put_status(:ok)
        |> render("show.json", user: user)

      {:error, _} ->
        conn
        |> put_status(:bad_request)
        |> text("Bad Request")
    end
  end
end
