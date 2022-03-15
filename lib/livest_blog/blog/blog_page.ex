defmodule LivestBlog.Blog.BlogPage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogpages" do
    field :apiUrl, :string
    field :pageId, :string
    field :pillarId, :string
    field :pillarName, :string
    field :sectionId, :string
    field :sectionName, :string
    field :type, :string
    field :webPublicationDate, :naive_datetime
    field :webTitle, :string
    field :webUrl, :string
    has_one :liveblogblock, LivestBlog.Blog.LiveBlogBlock

    timestamps()
  end

  @doc false
  def changeset(blog_page, attrs) do
    blog_page
    |> cast(attrs, [
      :pageId,
      :type,
      :sectionId,
      :sectionName,
      :webPublicationDate,
      :webTitle,
      :webUrl,
      :apiUrl,
      :pillarId,
      :pillarName
    ])
    |> validate_required([
      :pageId,
      :type,
      :sectionId,
      :sectionName,
      :webPublicationDate,
      :webTitle,
      :webUrl,
      :apiUrl,
      :pillarId,
      :pillarName
    ])
  end
end
