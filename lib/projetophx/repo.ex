defmodule Projetophx.Repo do
  use Ecto.Repo,
    otp_app: :projetophx,
    adapter: Ecto.Adapters.Postgres
end
