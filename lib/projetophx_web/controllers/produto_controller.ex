defmodule ProjetophxWeb.ProdutoController do
  use ProjetophxWeb, :controller

  alias Projetophx.Mercado
  alias Projetophx.Mercado.Produto

  def index(conn, _params) do
    produto = Mercado.list_produto()
    render(conn, "index.html", produto: produto)
  end

  def new(conn, _params) do
    changeset = Mercado.change_produto(%Produto{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"produto" => produto_params}) do
    case Mercado.create_produto(produto_params) do
      {:ok, produto} ->
        conn
        |> put_flash(:info, "Produto created successfully.")
        |> redirect(to: Routes.produto_path(conn, :show, produto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    produto = Mercado.get_produto!(id)
    render(conn, "show.html", produto: produto)
  end

  def edit(conn, %{"id" => id}) do
    produto = Mercado.get_produto!(id)
    changeset = Mercado.change_produto(produto)
    render(conn, "edit.html", produto: produto, changeset: changeset)
  end

  def update(conn, %{"id" => id, "produto" => produto_params}) do
    produto = Mercado.get_produto!(id)

    case Mercado.update_produto(produto, produto_params) do
      {:ok, produto} ->
        conn
        |> put_flash(:info, "Produto updated successfully.")
        |> redirect(to: Routes.produto_path(conn, :show, produto))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", produto: produto, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    produto = Mercado.get_produto!(id)
    {:ok, _produto} = Mercado.delete_produto(produto)

    conn
    |> put_flash(:info, "Produto deleted successfully.")
    |> redirect(to: Routes.produto_path(conn, :index))
  end
end
