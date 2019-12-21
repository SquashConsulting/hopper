defmodule HopperWeb.UserView do
  use HopperWeb, :view

  alias HopperWeb.{UserView, RouteView}

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user["_key"],
      email: user["email"],
      username: user["username"],
      rides: RouteView.render("user.json", routes: user["routes"])
    }
  end
end
