defmodule Hopper.Repo do
  use Ecto.Repo,
    otp_app: :hopper,
    adapter: Ecto.Adapters.Postgres
end
