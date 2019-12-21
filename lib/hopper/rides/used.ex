defmodule Hopper.Rides.Used do
  use Hopper.Schema
  import Ecto.Changeset

  schema "used" do
    field :_from, :string
    field :_to, :string
    field :as, :string

    timestamps()
  end

  @doc false
  def changeset(used, attrs) do
    used
    |> cast(attrs, [:_from, :_to, :as])
    |> validate_required([:_from, :_to, :as])
  end
end
