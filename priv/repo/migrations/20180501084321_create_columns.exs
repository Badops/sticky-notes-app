defmodule StickyNotesApp.Repo.Migrations.CreateColumns do
  use Ecto.Migration

  def change do
    create table(:columns) do
      add :columns_html, :text
      add :username, :string

      timestamps()
    end

  end
end
