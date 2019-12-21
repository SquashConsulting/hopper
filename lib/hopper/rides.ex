defmodule Hopper.Rides do
  @moduledoc """
  The Rides context.
  """

  alias Hopper.Repo

  alias Hopper.Rides.{Route, Used}

  @doc """
  Returns the list of routes.

  ## Examples

      iex> list_routes()
      [%{}, ...]

  """
  def list_routes do
    Repo.all(Route)
  end

  @doc """
  Gets a single route.

  Raises `Ecto.NoResultsError` if the Route does not exist.

  ## Examples

      iex> get_route(123)
      %Route{}

      iex> get_route(456)
      ** (Ecto.NoResultsError)

  """
  def get_route(id), do: Repo.get(Route, id)

  @doc """
  Creates a route.

  ## Examples

      iex> create_route(%{field: value})
      {:ok, %Route{}}

      iex> create_route(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_route(attrs \\ %{}) do
    %Route{}
    |> Route.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a route.

  ## Examples

      iex> update_route(id, %{field: new_value})
      {:ok, %Route{}}

      iex> update_route(id, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_route(id, attrs) do
    %Route{}
    |> Route.changeset(attrs)
    |> Repo.update(id)
  end

  @doc """
  Deletes a Route.

  ## Examples

      iex> delete_route(route)
      {:ok, %Route{}}

      iex> delete_route(route)
      {:error, %Ecto.Changeset{}}

  """
  def delete_route(id) do
    Repo.delete(Route, id)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking route changes.

  ## Examples

      iex> change_route(route)
      %Ecto.Changeset{source: %Route{}}

  """
  def change_route(%Route{} = route) do
    Route.changeset(route, %{})
  end

  def create_used(attrs \\ %{}) do
    %Used{}
    |> Used.changeset(attrs)
    |> Repo.insert()
  end
end
