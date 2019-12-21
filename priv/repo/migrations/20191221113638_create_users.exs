defmodule Hopper.Repo.Migrations.CreateUsers do
  alias Elixir.Hopper.Repo

  def up do
    Repo.create_collection("users", :document)
  end

  def down do
    Repo.drop_collection("users")
  end
end
