defmodule LivestBlogWeb.LiveBlogBlockLive.Show do
  use LivestBlogWeb, :live_view

  alias LivestBlog.Blog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:live_blog_block, Blog.get_live_blog_block!(id))}
  end

  defp page_title(:show), do: "Show Live blog block"
  defp page_title(:edit), do: "Edit Live blog block"
end
