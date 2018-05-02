defmodule StickyNotesAppWeb.DashboardController do
  use StickyNotesAppWeb, :controller

  alias StickyNotesApp.Notes.Column
  alias StickyNotesApp.Accounts
  alias StickyNotesApp.Notes


  def index(conn, %{"user" => username}) do
    user = Accounts.get_user_by_username(username)

    updated_conn = conn
		|> assign(:current_user, user)
    |> put_session(:user, user.username)
    
    render updated_conn, "index.html"
  end

  def update_content({:ok, html_string}, username) do
    column = Notes.get_column_by_username(username)
    column_map = %{"columns_html" => html_string}
    Notes.update_column(column, column_map)
  end

  def get_html_content(username) do
    column = Notes.get_column_by_username(username)
    
    column.columns_html
  end
end