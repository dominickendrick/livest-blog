defmodule LivestBlog.Blog.LiveBlogBlock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "liveblogblocks" do
    field :content, :string
    field :date, :naive_datetime
    field :key_event, :boolean, default: false
    field :pinned, :boolean, default: false
    field :title, :string
    field :updated_time, :naive_datetime
    belongs_to :blogpage, LivestBlog.Blog.BlogPage

    timestamps()
  end

  @doc false
  def changeset(live_blog_block, attrs) do
    live_blog_block
    |> cast(attrs, [:date, :title, :content, :pinned, :key_event, :updated_time, :blogpage_id])
    |> validate_required([
      :date,
      :title,
      :content,
      :pinned,
      :key_event,
      :updated_time,
      :blogpage_id
    ])
  end
end
