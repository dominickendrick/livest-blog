defmodule LivestBlogWeb.LiveBlogBlockLive.FormComponent do
  use LivestBlogWeb, :live_component

  alias LivestBlog.Blog

  @impl true
  def update(%{live_blog_block: live_blog_block} = assigns, socket) do
    changeset = Blog.change_live_blog_block(live_blog_block)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"live_blog_block" => live_blog_block_params}, socket) do
    changeset =
      socket.assigns.live_blog_block
      |> Blog.change_live_blog_block(live_blog_block_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"live_blog_block" => live_blog_block_params}, socket) do
    save_live_blog_block(socket, socket.assigns.action, live_blog_block_params)
  end

  defp save_live_blog_block(socket, :edit, live_blog_block_params) do
    case Blog.update_live_blog_block(socket.assigns.live_blog_block, live_blog_block_params) do
      {:ok, _live_blog_block} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live blog block updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_live_blog_block(socket, :new, live_blog_block_params) do
    case Blog.create_live_blog_block(live_blog_block_params) do
      {:ok, _live_blog_block} ->
        {:noreply,
         socket
         |> put_flash(:info, "Live blog block created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
