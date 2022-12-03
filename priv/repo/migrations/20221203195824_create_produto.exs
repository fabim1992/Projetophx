defmodule Projetophx.Repo.Migrations.CreateProduto do
  use Ecto.Migration

  def change do
    create table(:produto) do
      add :nome, :string
      add :categoria, :string
      add :preco, :float

      timestamps()
    end
  end
end
