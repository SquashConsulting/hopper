defmodule HopperWeb.Router do
  use HopperWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HopperWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit] do
      post "/:id/routes", UserController, :create_route
    end

    resources "/routes", RouteController, except: [:new, :edit]
  end
end
