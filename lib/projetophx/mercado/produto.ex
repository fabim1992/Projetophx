defmodule Projetophx.Mercado.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produto" do
    field :categoria, :string
    field :nome, :string
    field :preco, :float

    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:nome, :categoria, :preco])
    |> validate_required([:nome, :categoria, :preco])
  end
end
