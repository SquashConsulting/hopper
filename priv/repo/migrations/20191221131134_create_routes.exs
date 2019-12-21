defmodule Hopper.Repo.Migrations.CreateRoutes do
  import Elixir.Hopper.Repo, only: :functions

  def up do
    create_collection("routes", :document)
  end

  def down do
    drop_collection("routes")
  end
end
