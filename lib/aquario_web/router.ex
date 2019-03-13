defmodule AquarioWeb.Router do
  use AquarioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AquarioWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    scope "/admin", as: "admin", alias: Admin do
      get "/", PageController, :index
      resources "/tanks", TankController
      resources "/researches", ResearchController
      resources "/species", SpecieController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", AquarioWeb do
  #   pipe_through :api
  # end
end
