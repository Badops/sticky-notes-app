# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     StickyNotesApp.Repo.insert!(%StickyNotesApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias StickyNotesApp.Accounts
alias StickyNotesApp.Notes

Accounts.create_user(%{
    username: "badops"
})

Accounts.create_user(%{
    username: "schrligg"
})

Notes.create_column(%{
    username: "badops",
    columns_html: "<h1>Planning board using HTML 5 Drag & Drop</h1>
                  <div id=board><div>
                  <h3>ToDo</h3><h3>In Progress</h3><h3>Done</h3>
                  </div>
                  <div id=list-container>
                  <ul id=todo class=list>
                  <li id=item1 draggable=true>Task 1</li>
                  <li id=item2 draggable=true>Task 2</li>
                  </ul><ul id=inprogress class=list>
                  </ul><ul id=done class=list>
                  </ul></div></div>"
})

Notes.create_column(%{
    username: "schrligg",
    columns_html: "<h1>Planning board using HTML 5 Drag & Drop</h1>
                  <div id=board><div> 
                  <h3>ToDo</h3><h3>In Progress</h3><h3>Done</h3>
                  </div>
                  <div id=list-container>
                  <ul id=todo class=list>
                  <li id=item1 draggable=true>Task 1</li>
                  <li id=item2 draggable=true>Task 2</li>
                  </ul><ul id=inprogress class=list>
                  </ul>
                  <ul id=done class=list>
                  </ul></div></div>"
})
