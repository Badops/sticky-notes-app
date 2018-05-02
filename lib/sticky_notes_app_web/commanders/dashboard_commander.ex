defmodule StickyNotesAppWeb.DashboardCommander do
  use Drab.Commander
  alias StickyNotesAppWeb.DashboardController
  import Drab.Query

  onload :page_loaded
  
  access_session [:user]

  # Drab Callbacks
  def page_loaded(socket) do
    username = get_session(socket, :user)
    put_username_to_store = socket
              |> put_store(:user, username)

    column = DashboardController.get_html_content(username)
    socket
    |> insert_html("#container", :afterbegin, column)

    socket
    |> exec_js("
      $(document).ready(function(){
        $('li').bind('dragstart', function(event) {
          event.originalEvent.dataTransfer.setData('text/plain',  event.target.getAttribute('id'));
        });

        $('ul').bind('dragover', function(event) {
          event.preventDefault();
        });

        $('ul').bind('dragenter', function(event) {
          $(this).addClass('over');
        });

        $('ul').bind('dragleave drop', function(event) {
          $(this).removeClass('over');
        });

        $('li').bind('drop', function(event) {
          return false;
        });

        $('ul').bind('drop', function(event) {
          var listitem = event.originalEvent.dataTransfer.getData('text/plain');
          event.target.appendChild(document.getElementById(listitem));
          event.preventDefault();
        });
      });"
      )
  end

  defhandler save(socket, _sender) do
    username = get_store(socket, :user)

    %{"container" => html_string} = socket
      |> select(:htmls, [from: "#container"])

    process_html_string(html_string)
    |> DashboardController.update_content(username)
  end

  defp process_html_string(html_string) do
    raw_html = html_string
        |> String.trim()
        |> String.replace("\n", "")
        |> String.replace("\"", "")

    {:ok, raw_html}
  end
end