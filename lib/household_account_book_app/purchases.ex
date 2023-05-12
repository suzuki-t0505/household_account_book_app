defmodule HouseholdAccountBookApp.Purchases do
  @moduledoc """
  The Purchases context.
  """

  import Ecto.Query, warn: false
  alias HouseholdAccountBookApp.Repo

  alias HouseholdAccountBookApp.Purchases.{Purchase, Category}

  @doc """
  Categoryをリストで返します。
  """
  def list_categories() do
    Repo.all(Category)
  end

  @doc """
  Categoryをキーワードリストで返します。
  """
  def keyword_list_categories() do
    Category
    |> Repo.all()
    |> Enum.reduce([], fn %Category{id: id, category_name: category_name}, list ->
      Keyword.merge(list, "#{category_name}": "#{id}")
    end)
  end

  @doc """
  Returns the list of purchase.

  ## Examples

      iex> list_purchase()
      [%Purchase{}, ...]

  """
  def list_purchase do
    Purchase
    |> Repo.all()
    |> Repo.preload(:category)
  end

  @doc """
  Gets a single purchase.

  Raises `Ecto.NoResultsError` if the Purchase does not exist.

  ## Examples

      iex> get_purchase!(123)
      %Purchase{}

      iex> get_purchase!(456)
      ** (Ecto.NoResultsError)

  """
  def get_purchase!(id) do
    Purchase
    |> Repo.get!(id)
    |> Repo.preload(:category)
  end

  @doc """
  Creates a purchase.

  ## Examples

      iex> create_purchase(%{field: value})
      {:ok, %Purchase{}}

      iex> create_purchase(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_purchase(attrs \\ %{}) do
    %Purchase{}
    |> Purchase.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a purchase.

  ## Examples

      iex> update_purchase(purchase, %{field: new_value})
      {:ok, %Purchase{}}

      iex> update_purchase(purchase, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_purchase(%Purchase{} = purchase, attrs) do
    purchase
    |> Purchase.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a purchase.

  ## Examples

      iex> delete_purchase(purchase)
      {:ok, %Purchase{}}

      iex> delete_purchase(purchase)
      {:error, %Ecto.Changeset{}}

  """
  def delete_purchase(%Purchase{} = purchase) do
    Repo.delete(purchase)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking purchase changes.

  ## Examples

      iex> change_purchase(purchase)
      %Ecto.Changeset{data: %Purchase{}}

  """
  def change_purchase(%Purchase{} = purchase, attrs \\ %{}) do
    Purchase.changeset(purchase, attrs)
  end
end
