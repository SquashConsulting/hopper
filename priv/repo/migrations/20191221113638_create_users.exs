defmodule Hopper.Repo.Migrations.CreateUsers do
  import Elixir.Hopper.Repo, only: :functions

  def up do
    create_collection("users", :document)
  end

  def down do
    drop_collection("users")
  end
end
