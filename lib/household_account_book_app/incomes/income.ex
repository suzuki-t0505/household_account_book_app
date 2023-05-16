defmodule HouseholdAccountBookApp.Incomes.Income do
  use Ecto.Schema
  import Ecto.Changeset

  schema "incomes" do
    field :date, :date
    field :money, :integer

    timestamps()
  end

  @doc false
  def changeset(income, attrs) do
    income
    |> cast(attrs, [:money, :date])
    |> validate_required([:money, :date])
    # |> unique_constraint(:date, message: "すでにこの日付は登録されています。")
    # |> unsafe_validate_unique(:date, HouseholdAccountBookApp.Repo, message: "すでにこの日付は登録されています。")
  end
end
