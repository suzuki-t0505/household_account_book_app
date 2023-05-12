defmodule HouseholdAccountBookApp.Repo.Migrations.CreatePurchase do
  use Ecto.Migration

  def change do
    create table(:purchase) do
      add :name, :string
      add :money, :integer
      add :date, :date
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:purchase, [:category_id])
  end
end
