defmodule Projetophx.MercadoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Projetophx.Mercado` context.
  """

  @doc """
  Generate a produto.
  """
  def produto_fixture(attrs \\ %{}) do
    {:ok, produto} =
      attrs
      |> Enum.into(%{
        categoria: "some categoria",
        nome: "some nome",
        preco: 120.5
      })
      |> Projetophx.Mercado.create_produto()

    produto
  end
end
