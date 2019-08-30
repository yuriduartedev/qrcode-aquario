defmodule AquarioWeb.Router do
  use AquarioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug AquarioWeb.SetLocalePlug, default: "pt_BR"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :login_layout do
    plug :put_layout, {AquarioWeb.LayoutView, :login}
  end

  pipeline :admin_layout do
    plug BasicAuth, use_config: {:aquario, :aquario_auth}
    plug :put_layout, {AquarioWeb.LayoutView, :admin}
  end

  scope "/", AquarioWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/tanks", TankController, :index
    get "/tanks/:id", TankController, :show

    get "/researches", ResearchController, :index
    get "/researches/:tank_id", ResearchController, :show
    
    scope "/login" do
      pipe_through :login_layout

      get "/", LoginController, :index
    end
    
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
