defmodule HopperWeb.Router do
  use HopperWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HopperWeb do
    pipe_through :api
  end
end
