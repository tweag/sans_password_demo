defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug Guardian.Plug.Pipeline,
      module: MyAppWeb.Guardian,
      error_handler: MyAppWeb.AuthController

    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource, allow_blank: true
  end

  scope "/", MyAppWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/login", AuthController, :new
    get "/logout", AuthController, :destroy
    post "/login", AuthController, :create
    get "/login/:magic_token", AuthController, :callback
  end
end
