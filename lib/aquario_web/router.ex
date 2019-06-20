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

  pipeline :admin_layout do
    plug :put_layout, {AquarioWeb.LayoutView, :admin}
  end

  scope "/", AquarioWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/tanks", TankController, :index
    get "/tanks/:id", TankController, :show

    get "/researches", ResearchController, :index
    get "/researches/:id", ResearchController, :show

    scope "/admin", as: "admin", alias: Admin do
      pipe_through :admin_layout

      get "/", PageController, :index
      resources "/tanks", TankController
      resources "/researches", ResearchController
      resources "/species", SpecyController
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", AquarioWeb do
  #   pipe_through :api
  # end
end
