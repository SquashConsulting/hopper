defmodule Hopper.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Hopper.Repo

  alias Hopper.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%{}, ...]

  """
  def list_users do
    Repo.all(User)
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
  def get_user(id), do: Repo.get(User, id)

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

  def get_keys() do
    query = """
      FOR user IN users
        RETURN user._key
    """

    Repo.query(query)
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
end