defmodule HouseholdAccountBookAppWeb.PurchaseControllerTest do
  use HouseholdAccountBookAppWeb.ConnCase

  import HouseholdAccountBookApp.PurchasesFixtures

  @create_attrs %{date: ~D[2023-05-11], money: 42, name: "some name"}
  @update_attrs %{date: ~D[2023-05-12], money: 43, name: "some updated name"}
  @invalid_attrs %{date: nil, money: nil, name: nil}

  describe "index" do
    test "lists all purchase", %{conn: conn} do
      conn = get(conn, ~p"/purchase")
      assert html_response(conn, 200) =~ "Listing Purchase"
    end
  end

  describe "new purchase" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/purchase/new")
      assert html_response(conn, 200) =~ "New Purchase"
    end
  end

  describe "create purchase" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/purchase", purchase: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/purchase/#{id}"

      conn = get(conn, ~p"/purchase/#{id}")
      assert html_response(conn, 200) =~ "Purchase #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/purchase", purchase: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Purchase"
    end
  end

  describe "edit purchase" do
    setup [:create_purchase]

    test "renders form for editing chosen purchase", %{conn: conn, purchase: purchase} do
      conn = get(conn, ~p"/purchase/#{purchase}/edit")
      assert html_response(conn, 200) =~ "Edit Purchase"
    end
  end

  describe "update purchase" do
    setup [:create_purchase]

    test "redirects when data is valid", %{conn: conn, purchase: purchase} do
      conn = put(conn, ~p"/purchase/#{purchase}", purchase: @update_attrs)
      assert redirected_to(conn) == ~p"/purchase/#{purchase}"

      conn = get(conn, ~p"/purchase/#{purchase}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, purchase: purchase} do
      conn = put(conn, ~p"/purchase/#{purchase}", purchase: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Purchase"
    end
  end

  describe "delete purchase" do
    setup [:create_purchase]

    test "deletes chosen purchase", %{conn: conn, purchase: purchase} do
      conn = delete(conn, ~p"/purchase/#{purchase}")
      assert redirected_to(conn) == ~p"/purchase"

      assert_error_sent 404, fn ->
        get(conn, ~p"/purchase/#{purchase}")
      end
    end
  end

  defp create_purchase(_) do
    purchase = purchase_fixture()
    %{purchase: purchase}
  end
end
