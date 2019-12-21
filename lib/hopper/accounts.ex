defmodule Hopper.Accounts do
  @moduledoc """
  The Accounts context.
  """

  alias Hopper.Repo

  alias Hopper.Rides
  alias Hopper.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%{}, ...]

  """
  def list_users do
    {:ok, result} =
      Repo.query("""
        FOR user IN users
          let routes = (#{used_routes("user")})

          RETURN MERGE(user, { routes })
      """)

    result
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user(123)
      {:ok %{}}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user(id) do
    {:ok, result} =
      Repo.query("""
       let user = DOCUMENT("users/#{id}")
       let routes = (#{used_routes("user")})

       RETURN MERGE(user, { routes })
      """)

    {:ok, result |> List.first()}
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(id, attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.update(id)
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(id)
      :ok

      iex> delete_user(user)
      {:error, 404}

  """
  def delete_user(id) do
    Repo.delete(User, id)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def create_ride(user_id, %{"used_as" => as, "route_id" => route_id}) do
    {:ok, _} = Rides.create_used(%{_from: "users/#{user_id}", _to: "routes/#{route_id}", as: as})
    get_user(user_id)
  end

  defp used_routes(vertex) do
    """
      FOR v, e IN 1..1 OUTBOUND #{vertex} used
        RETURN MERGE(v, { used_as: e.as })
    """
  end
end
