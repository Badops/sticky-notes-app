defmodule StickyNotesApp.Notes.Column do
  use Ecto.Schema
  import Ecto.Changeset


  schema "columns" do
    field :columns_html, :string
    field :username, :string

    timestamps()
  end

  @required_fields [:columns_html, :username]
  @optional_fields []

  @doc false
  def changeset(column, attrs) do
    column
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
