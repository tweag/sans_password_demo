defmodule MyAppWeb.AuthController do
  use MyAppWeb, :controller

  alias MyApp.Accounts
  alias MyAppWeb.Guardian

  def new(conn, _params) do
    conn
    |> assign(:changeset, Accounts.change_user())
    |> render("new.html")
  end

  def create(conn, %{"user" => %{"email" => email}}) do
    case Accounts.get_or_create_by_email(email) do
      {:ok, user} ->
        {:ok, _, _} = Guardian.send_magic_link(user)
        render(conn, "create.html")

      {:error, changeset} ->
        conn
        |> assign(:changeset, changeset)
        |> render("new.html")
    end
  end

  def callback(conn, %{"magic_token" => magic_token}) do
    case Guardian.decode_magic(magic_token) do
      {:ok, user, _claims} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: page_path(conn, :index))

      _ ->
        conn
        |> put_flash(:error, "Invalid magic link.")
        |> redirect(to: auth_path(conn, :new))
    end
  end

  def destroy(conn, _params) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: page_path(conn, :index))
  end

  def auth_error(conn, error, _opts) do
    conn
    |> put_flash(:error, "Authentication error.")
    |> redirect(to: auth_path(conn, :new))
    |> halt()
  end
end
