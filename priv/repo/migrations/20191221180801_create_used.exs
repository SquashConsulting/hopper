defmodule Hopper.Repo.Migrations.CreateUsed do
  import Hopper.Repo

  def up do
    create_collection("used", :edge)
  end

  def down do
    drop_collection("used")
  end
end
