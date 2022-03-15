defmodule LivestBlogWeb.BlogPageController do
  use LivestBlogWeb, :controller

  alias LivestBlog.Blog
  alias LivestBlog.Blog.BlogPage

  def index(conn, _params) do
    blogpages = Blog.list_blogpages()
    render(conn, "index.html", blogpages: blogpages)
  end

  def new(conn, _params) do
    changeset = Blog.change_blog_page(%BlogPage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blog_page" => blog_page_params}) do
    case Blog.create_blog_page(blog_page_params) do
      {:ok, blog_page} ->
        conn
        |> put_flash(:info, "Blog page created successfully.")
        |> redirect(to: Routes.blog_page_path(conn, :show, blog_page))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    blog_page = Blog.get_blog_page!(id)
    render(conn, "show.html", blog_page: blog_page)
  end

  def edit(conn, %{"id" => id}) do
    blog_page = Blog.get_blog_page!(id)
    changeset = Blog.change_blog_page(blog_page)
    render(conn, "edit.html", blog_page: blog_page, changeset: changeset)
  end

  def update(conn, %{"id" => id, "blog_page" => blog_page_params}) do
    blog_page = Blog.get_blog_page!(id)

    case Blog.update_blog_page(blog_page, blog_page_params) do
      {:ok, blog_page} ->
        conn
        |> put_flash(:info, "Blog page updated successfully.")
        |> redirect(to: Routes.blog_page_path(conn, :show, blog_page))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", blog_page: blog_page, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    blog_page = Blog.get_blog_page!(id)
    {:ok, _blog_page} = Blog.delete_blog_page(blog_page)

    conn
    |> put_flash(:info, "Blog page deleted successfully.")
    |> redirect(to: Routes.blog_page_path(conn, :index))
  end
end
