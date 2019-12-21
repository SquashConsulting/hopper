defmodule HopperWeb.RouteView do
  use HopperWeb, :view

  alias HopperWeb.RouteView

  def render("index.json", %{routes: routes}) do
    %{data: render_many(routes, RouteView, "route.json")}
  end

  def render("show.json", %{route: route}) do
    %{data: render_one(route, RouteView, "route.json")}
  end

  def render("user.json", %{routes: routes}) do
    %{data: render_many(routes, RouteView, "relationship.json")}
  end

  def render("route.json", %{route: route}) do
    %{
      id: route["_key"],
      steps: route["steps"]
    }
  end

  def render("relationship.json", %{route: route}) do
    %{
      id: route["_key"],
      steps: route["steps"],
      used_as: route["used_as"]
    }
  end
end
