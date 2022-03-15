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
end
