defmodule ProjetophxWeb.PageController do
  use ProjetophxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
