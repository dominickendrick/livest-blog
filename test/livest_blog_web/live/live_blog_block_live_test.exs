defmodule LivestBlogWeb.LiveBlogBlockLiveTest do
  use LivestBlogWeb.ConnCase

  import Phoenix.LiveViewTest
  import LivestBlog.BlogFixtures

  @create_attrs %{content: "some content", date: %{day: 14, hour: 11, minute: 2, month: 3, year: 2022}, key_event: true, pinned: true, title: "some title", updated_time: %{day: 14, hour: 11, minute: 2, month: 3, year: 2022}}
  @update_attrs %{content: "some updated content", date: %{day: 15, hour: 11, minute: 2, month: 3, year: 2022}, key_event: false, pinned: false, title: "some updated title", updated_time: %{day: 15, hour: 11, minute: 2, month: 3, year: 2022}}
  @invalid_attrs %{content: nil, date: %{day: 30, hour: 11, minute: 2, month: 2, year: 2022}, key_event: false, pinned: false, title: nil, updated_time: %{day: 30, hour: 11, minute: 2, month: 2, year: 2022}}

  defp create_live_blog_block(_) do
    live_blog_block = live_blog_block_fixture()
    %{live_blog_block: live_blog_block}
  end

  describe "Index" do
    setup [:create_live_blog_block]

    test "lists all liveblogblocks", %{conn: conn, live_blog_block: live_blog_block} do
      {:ok, _index_live, html} = live(conn, Routes.live_blog_block_index_path(conn, :index))

      assert html =~ "Listing Liveblogblocks"
      assert html =~ live_blog_block.content
    end

    test "saves new live_blog_block", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.live_blog_block_index_path(conn, :index))

      assert index_live |> element("a", "New Live blog block") |> render_click() =~
               "New Live blog block"

      assert_patch(index_live, Routes.live_blog_block_index_path(conn, :new))

      assert index_live
             |> form("#live_blog_block-form", live_blog_block: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#live_blog_block-form", live_blog_block: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.live_blog_block_index_path(conn, :index))

      assert html =~ "Live blog block created successfully"
      assert html =~ "some content"
    end

    test "updates live_blog_block in listing", %{conn: conn, live_blog_block: live_blog_block} do
      {:ok, index_live, _html} = live(conn, Routes.live_blog_block_index_path(conn, :index))

      assert index_live |> element("#live_blog_block-#{live_blog_block.id} a", "Edit") |> render_click() =~
               "Edit Live blog block"

      assert_patch(index_live, Routes.live_blog_block_index_path(conn, :edit, live_blog_block))

      assert index_live
             |> form("#live_blog_block-form", live_blog_block: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#live_blog_block-form", live_blog_block: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.live_blog_block_index_path(conn, :index))

      assert html =~ "Live blog block updated successfully"
      assert html =~ "some updated content"
    end

    test "deletes live_blog_block in listing", %{conn: conn, live_blog_block: live_blog_block} do
      {:ok, index_live, _html} = live(conn, Routes.live_blog_block_index_path(conn, :index))

      assert index_live |> element("#live_blog_block-#{live_blog_block.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#live_blog_block-#{live_blog_block.id}")
    end
  end

  describe "Show" do
    setup [:create_live_blog_block]

    test "displays live_blog_block", %{conn: conn, live_blog_block: live_blog_block} do
      {:ok, _show_live, html} = live(conn, Routes.live_blog_block_show_path(conn, :show, live_blog_block))

      assert html =~ "Show Live blog block"
      assert html =~ live_blog_block.content
    end

    test "updates live_blog_block within modal", %{conn: conn, live_blog_block: live_blog_block} do
      {:ok, show_live, _html} = live(conn, Routes.live_blog_block_show_path(conn, :show, live_blog_block))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Live blog block"

      assert_patch(show_live, Routes.live_blog_block_show_path(conn, :edit, live_blog_block))

      assert show_live
             |> form("#live_blog_block-form", live_blog_block: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#live_blog_block-form", live_blog_block: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.live_blog_block_show_path(conn, :show, live_blog_block))

      assert html =~ "Live blog block updated successfully"
      assert html =~ "some updated content"
    end
  end
end
