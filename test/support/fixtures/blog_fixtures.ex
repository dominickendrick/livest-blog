defmodule LivestBlog.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LivestBlog.Blog` context.
  """

  @doc """
  Generate a blog_page.
  """
  def blog_page_fixture(attrs \\ %{}) do
    {:ok, blog_page} =
      attrs
      |> Enum.into(%{
        apiUrl: "some apiUrl",
        id: "some id",
        pillarId: "some pillarId",
        pillarName: "some pillarName",
        sectionId: "some sectionId",
        sectionName: "some sectionName",
        type: "some type",
        webPublicationDate: ~N[2022-03-14 10:00:00],
        webTitle: "some webTitle",
        webUrl: "some webUrl"
      })
      |> LivestBlog.Blog.create_blog_page()

    blog_page
  end

  @doc """
  Generate a blog_page.
  """
  def blog_page_fixture(attrs \\ %{}) do
    {:ok, blog_page} =
      attrs
      |> Enum.into(%{
        apiUrl: "some apiUrl",
        pageId: "some pageId",
        pillarId: "some pillarId",
        pillarName: "some pillarName",
        sectionId: "some sectionId",
        sectionName: "some sectionName",
        type: "some type",
        webPublicationDate: ~N[2022-03-14 10:01:00],
        webTitle: "some webTitle",
        webUrl: "some webUrl"
      })
      |> LivestBlog.Blog.create_blog_page()

    blog_page
  end

  @doc """
  Generate a live_blog_block.
  """
  def live_blog_block_fixture(attrs \\ %{}) do
    {:ok, live_blog_block} =
      attrs
      |> Enum.into(%{
        content: "some content",
        date: ~N[2022-03-14 11:02:00],
        key_event: true,
        pinned: true,
        title: "some title",
        updated_time: ~N[2022-03-14 11:02:00]
      })
      |> LivestBlog.Blog.create_live_blog_block()

    live_blog_block
  end
end
