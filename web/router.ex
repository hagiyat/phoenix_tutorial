defmodule RailsTutorial.Router do
  use RailsTutorial.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RailsTutorial do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    resources "/microposts", MicropostController

    get "/static_page/home", StaticPageController, :home
    get "/static_page/help", StaticPageController, :help
    get "/static_page/about", StaticPageController, :about
  end

  # Other scopes may use custom stacks.
  # scope "/api", RailsTutorial do
  #   pipe_through :api
  # end
end
