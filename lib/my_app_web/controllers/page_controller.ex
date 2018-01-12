defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller

  alias MyApp.Accounts
  alias MyAppWeb.Guardian

  def index(conn, _params) do
    conn
    |> assign(:users, Accounts.list_users())
    |> assign(:current_user, Guardian.Plug.current_resource(conn))
    |> render("index.html")
  end
end
