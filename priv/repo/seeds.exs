# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HouseholdAccountBookApp.Repo.insert!(%HouseholdAccountBookApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias HouseholdAccountBookApp.Repo
alias HouseholdAccountBookApp.Purchases.Category

category_names = ~w(
  住宅費
  水道光熱費
  通信費
  交通費
  食費
  日用品
  医療費
  交際費
  娯楽費
  雑費
)

Enum.map(category_names, fn category_name ->
  Repo.insert(%Category{category_name: category_name})
end)
