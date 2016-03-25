defmodule Hasharet.PageController do
  use Hasharet.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
