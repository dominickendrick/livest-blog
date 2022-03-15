defmodule LivestBlog.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias LivestBlog.Repo

  alias LivestBlog.Blog.BlogPage

  @doc """
  Returns the list of blogpages.

  ## Examples

      iex> list_blogpages()
      [%BlogPage{}, ...]

  """
  def list_blogpages do
    Repo.all(BlogPage)
  end

  @doc """
  Gets a single blog_page.

  Raises `Ecto.NoResultsError` if the Blog page does not exist.

  ## Examples

      iex> get_blog_page!(123)
      %BlogPage{}

      iex> get_blog_page!(456)
      ** (Ecto.NoResultsError)

  """
  def get_blog_page!(id), do: Repo.get!(BlogPage, id)

  @doc """
  Creates a blog_page.

  ## Examples

      iex> create_blog_page(%{field: value})
      {:ok, %BlogPage{}}

      iex> create_blog_page(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_blog_page(attrs \\ %{}) do
    %BlogPage{}
    |> BlogPage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a blog_page.

  ## Examples

      iex> update_blog_page(blog_page, %{field: new_value})
      {:ok, %BlogPage{}}

      iex> update_blog_page(blog_page, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_blog_page(%BlogPage{} = blog_page, attrs) do
    blog_page
    |> BlogPage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a blog_page.

  ## Examples

      iex> delete_blog_page(blog_page)
      {:ok, %BlogPage{}}

      iex> delete_blog_page(blog_page)
      {:error, %Ecto.Changeset{}}

  """
  def delete_blog_page(%BlogPage{} = blog_page) do
    Repo.delete(blog_page)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking blog_page changes.

  ## Examples

      iex> change_blog_page(blog_page)
      %Ecto.Changeset{data: %BlogPage{}}

  """
  def change_blog_page(%BlogPage{} = blog_page, attrs \\ %{}) do
    BlogPage.changeset(blog_page, attrs)
  end
end
