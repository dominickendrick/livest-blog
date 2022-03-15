defmodule LivestBlogWeb.BlogPageControllerTest do
  use LivestBlogWeb.ConnCase

  import LivestBlog.BlogFixtures

  @create_attrs %{apiUrl: "some apiUrl", pageId: "some pageId", pillarId: "some pillarId", pillarName: "some pillarName", sectionId: "some sectionId", sectionName: "some sectionName", type: "some type", webPublicationDate: ~N[2022-03-14 10:01:00], webTitle: "some webTitle", webUrl: "some webUrl"}
  @update_attrs %{apiUrl: "some updated apiUrl", pageId: "some updated pageId", pillarId: "some updated pillarId", pillarName: "some updated pillarName", sectionId: "some updated sectionId", sectionName: "some updated sectionName", type: "some updated type", webPublicationDate: ~N[2022-03-15 10:01:00], webTitle: "some updated webTitle", webUrl: "some updated webUrl"}
  @invalid_attrs %{apiUrl: nil, pageId: nil, pillarId: nil, pillarName: nil, sectionId: nil, sectionName: nil, type: nil, webPublicationDate: nil, webTitle: nil, webUrl: nil}

  describe "index" do
    test "lists all blogpages", %{conn: conn} do
      conn = get(conn, Routes.blog_page_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Blogpages"
    end
  end

  describe "new blog_page" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.blog_page_path(conn, :new))
      assert html_response(conn, 200) =~ "New Blog page"
    end
  end

  describe "create blog_page" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.blog_page_path(conn, :create), blog_page: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.blog_page_path(conn, :show, id)

      conn = get(conn, Routes.blog_page_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Blog page"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.blog_page_path(conn, :create), blog_page: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Blog page"
    end
  end

  describe "edit blog_page" do
    setup [:create_blog_page]

    test "renders form for editing chosen blog_page", %{conn: conn, blog_page: blog_page} do
      conn = get(conn, Routes.blog_page_path(conn, :edit, blog_page))
      assert html_response(conn, 200) =~ "Edit Blog page"
    end
  end

  describe "update blog_page" do
    setup [:create_blog_page]

    test "redirects when data is valid", %{conn: conn, blog_page: blog_page} do
      conn = put(conn, Routes.blog_page_path(conn, :update, blog_page), blog_page: @update_attrs)
      assert redirected_to(conn) == Routes.blog_page_path(conn, :show, blog_page)

      conn = get(conn, Routes.blog_page_path(conn, :show, blog_page))
      assert html_response(conn, 200) =~ "some updated apiUrl"
    end

    test "renders errors when data is invalid", %{conn: conn, blog_page: blog_page} do
      conn = put(conn, Routes.blog_page_path(conn, :update, blog_page), blog_page: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Blog page"
    end
  end

  describe "delete blog_page" do
    setup [:create_blog_page]

    test "deletes chosen blog_page", %{conn: conn, blog_page: blog_page} do
      conn = delete(conn, Routes.blog_page_path(conn, :delete, blog_page))
      assert redirected_to(conn) == Routes.blog_page_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.blog_page_path(conn, :show, blog_page))
      end
    end
  end

  defp create_blog_page(_) do
    blog_page = blog_page_fixture()
    %{blog_page: blog_page}
  end
end
