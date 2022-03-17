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
  Returns the list of blogpages ids and titles.

  ## Examples

      iex> list_blogpages()
      [{id: "1", title: "Title"}, ...]

  """
  def list_blogpage_ids do
    Repo.all(BlogPage)
    |> Enum.map(fn x -> [key: x.webTitle, value: x.id] end)
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

  alias LivestBlog.Blog.LiveBlogBlock

  @doc """
  Returns the list of liveblogblocks.

  ## Examples

      iex> list_liveblogblocks()
      [%LiveBlogBlock{}, ...]

  """
  def list_liveblogblocks do
    Repo.all(LiveBlogBlock)
  end

  @doc """
  Gets a single live_blog_block.

  Raises `Ecto.NoResultsError` if the Live blog block does not exist.

  ## Examples

      iex> get_live_blog_block!(123)
      %LiveBlogBlock{}

      iex> get_live_blog_block!(456)
      ** (Ecto.NoResultsError)

  """
  def get_live_blog_block!(id), do: Repo.get!(LiveBlogBlock, id)

  @doc """
  Creates a live_blog_block.

  ## Examples

      iex> create_live_blog_block(%{field: value})
      {:ok, %LiveBlogBlock{}}

      iex> create_live_blog_block(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_live_blog_block(attrs \\ %{}) do
    IO.inspect(attrs)

    %LiveBlogBlock{}
    |> LiveBlogBlock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a live_blog_block.

  ## Examples

      iex> update_live_blog_block(live_blog_block, %{field: new_value})
      {:ok, %LiveBlogBlock{}}

      iex> update_live_blog_block(live_blog_block, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_live_blog_block(%LiveBlogBlock{} = live_blog_block, attrs) do
    live_blog_block
    |> LiveBlogBlock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a live_blog_block.

  ## Examples

      iex> delete_live_blog_block(live_blog_block)
      {:ok, %LiveBlogBlock{}}

      iex> delete_live_blog_block(live_blog_block)
      {:error, %Ecto.Changeset{}}

  """
  def delete_live_blog_block(%LiveBlogBlock{} = live_blog_block) do
    Repo.delete(live_blog_block)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking live_blog_block changes.

  ## Examples

      iex> change_live_blog_block(live_blog_block)
      %Ecto.Changeset{data: %LiveBlogBlock{}}

  """
  def change_live_blog_block(%LiveBlogBlock{} = live_blog_block, attrs \\ %{}) do
    LiveBlogBlock.changeset(live_blog_block, attrs)
  end
end
