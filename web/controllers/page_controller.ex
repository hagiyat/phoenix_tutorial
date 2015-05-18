defmodule RailsTutorial.PageController do
  use RailsTutorial.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
