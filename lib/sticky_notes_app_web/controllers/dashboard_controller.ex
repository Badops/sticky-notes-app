defmodule StickyNotesAppWeb.DashboardController do
  use StickyNotesAppWeb, :controller

  alias StickyNotesApp.Accounts

  def index(conn, %{"user" => username}) do
    user = Accounts.get_user_by_username(username)
    render conn, "index.html", user: user
  end
end