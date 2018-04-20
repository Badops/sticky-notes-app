defmodule StickyNotesAppWeb.PageController do
  use StickyNotesAppWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
