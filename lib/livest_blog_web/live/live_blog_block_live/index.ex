defmodule LivestBlogWeb.LiveBlogBlockLive.Index do
  use LivestBlogWeb, :live_view

  alias LivestBlog.Blog
  alias LivestBlog.Blog.LiveBlogBlock

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :liveblogblocks, list_liveblogblocks())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Live blog block")
    |> assign(:blog_ids, Blog.list_blogpage_ids())
    |> assign(:live_blog_block, Blog.get_live_blog_block!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:blog_ids, Blog.list_blogpage_ids())
    |> assign(:page_title, "New Live blog block")
    |> assign(:live_blog_block, %LiveBlogBlock{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Liveblogblocks")
    |> assign(:live_blog_block, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    live_blog_block = Blog.get_live_blog_block!(id)
    {:ok, _} = Blog.delete_live_blog_block(live_blog_block)

    {:noreply, assign(socket, :liveblogblocks, list_liveblogblocks())}
  end

  defp list_liveblogblocks do
    Blog.list_liveblogblocks()
  end
end
