defmodule Hopper.Rides.Route do
  use Hopper.Schema
  import Ecto.Changeset

  schema "routes" do
    field :steps, {:array, :map}

    timestamps()
  end

  @doc false
  def changeset(route, attrs) do
    route
    |> cast(attrs, [:steps])
    |> validate_required([:steps])
  end
end
