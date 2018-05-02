defmodule StickyNotesApp.NotesTest do
  use StickyNotesApp.DataCase

  alias StickyNotesApp.Notes

  describe "cards" do
    alias StickyNotesApp.Notes.Card

    @valid_attrs %{column: 42, identity: "some identity"}
    @update_attrs %{column: 43, identity: "some updated identity"}
    @invalid_attrs %{column: nil, identity: nil}

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Notes.create_card()

      card
    end

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Notes.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Notes.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Notes.create_card(@valid_attrs)
      assert card.column == 42
      assert card.identity == "some identity"
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notes.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, card} = Notes.update_card(card, @update_attrs)
      assert %Card{} = card
      assert card.column == 43
      assert card.identity == "some updated identity"
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_card(card, @invalid_attrs)
      assert card == Notes.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Notes.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Notes.change_card(card)
    end
  end

  describe "columns" do
    alias StickyNotesApp.Notes.Column

    @valid_attrs %{columns_html: "some columns_html"}
    @update_attrs %{columns_html: "some updated columns_html"}
    @invalid_attrs %{columns_html: nil}

    def column_fixture(attrs \\ %{}) do
      {:ok, column} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Notes.create_column()

      column
    end

    test "list_columns/0 returns all columns" do
      column = column_fixture()
      assert Notes.list_columns() == [column]
    end

    test "get_column!/1 returns the column with given id" do
      column = column_fixture()
      assert Notes.get_column!(column.id) == column
    end

    test "create_column/1 with valid data creates a column" do
      assert {:ok, %Column{} = column} = Notes.create_column(@valid_attrs)
      assert column.columns_html == "some columns_html"
    end

    test "create_column/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notes.create_column(@invalid_attrs)
    end

    test "update_column/2 with valid data updates the column" do
      column = column_fixture()
      assert {:ok, column} = Notes.update_column(column, @update_attrs)
      assert %Column{} = column
      assert column.columns_html == "some updated columns_html"
    end

    test "update_column/2 with invalid data returns error changeset" do
      column = column_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_column(column, @invalid_attrs)
      assert column == Notes.get_column!(column.id)
    end

    test "delete_column/1 deletes the column" do
      column = column_fixture()
      assert {:ok, %Column{}} = Notes.delete_column(column)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_column!(column.id) end
    end

    test "change_column/1 returns a column changeset" do
      column = column_fixture()
      assert %Ecto.Changeset{} = Notes.change_column(column)
    end
  end
end
