defmodule LivestBlogWeb.PageController do
  use LivestBlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
