defmodule HouseholdAccountBookApp.Purchases.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :category_name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:category_name])
    |> validate_required([:category_name])
  end
end
