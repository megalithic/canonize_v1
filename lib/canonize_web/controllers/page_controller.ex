defmodule CanonizeWeb.PageController do
  use CanonizeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
