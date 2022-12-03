defmodule Projetophx.MercadoTest do
  use Projetophx.DataCase

  alias Projetophx.Mercado

  describe "produto" do
    alias Projetophx.Mercado.Produto

    import Projetophx.MercadoFixtures

    @invalid_attrs %{categoria: nil, nome: nil, preco: nil}

    test "list_produto/0 returns all produto" do
      produto = produto_fixture()
      assert Mercado.list_produto() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Mercado.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      valid_attrs = %{categoria: "some categoria", nome: "some nome", preco: 120.5}

      assert {:ok, %Produto{} = produto} = Mercado.create_produto(valid_attrs)
      assert produto.categoria == "some categoria"
      assert produto.nome == "some nome"
      assert produto.preco == 120.5
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mercado.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      update_attrs = %{categoria: "some updated categoria", nome: "some updated nome", preco: 456.7}

      assert {:ok, %Produto{} = produto} = Mercado.update_produto(produto, update_attrs)
      assert produto.categoria == "some updated categoria"
      assert produto.nome == "some updated nome"
      assert produto.preco == 456.7
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Mercado.update_produto(produto, @invalid_attrs)
      assert produto == Mercado.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Mercado.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Mercado.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Mercado.change_produto(produto)
    end
  end
end
