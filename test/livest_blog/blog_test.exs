defmodule LivestBlog.BlogTest do
  use LivestBlog.DataCase

  alias LivestBlog.Blog

  describe "blogpages" do
    alias LivestBlog.Blog.BlogPage

    import LivestBlog.BlogFixtures

    @invalid_attrs %{apiUrl: nil, id: nil, pillarId: nil, pillarName: nil, sectionId: nil, sectionName: nil, type: nil, webPublicationDate: nil, webTitle: nil, webUrl: nil}

    test "list_blogpages/0 returns all blogpages" do
      blog_page = blog_page_fixture()
      assert Blog.list_blogpages() == [blog_page]
    end

    test "get_blog_page!/1 returns the blog_page with given id" do
      blog_page = blog_page_fixture()
      assert Blog.get_blog_page!(blog_page.id) == blog_page
    end

    test "create_blog_page/1 with valid data creates a blog_page" do
      valid_attrs = %{apiUrl: "some apiUrl", id: "some id", pillarId: "some pillarId", pillarName: "some pillarName", sectionId: "some sectionId", sectionName: "some sectionName", type: "some type", webPublicationDate: ~N[2022-03-14 10:00:00], webTitle: "some webTitle", webUrl: "some webUrl"}

      assert {:ok, %BlogPage{} = blog_page} = Blog.create_blog_page(valid_attrs)
      assert blog_page.apiUrl == "some apiUrl"
      assert blog_page.id == "some id"
      assert blog_page.pillarId == "some pillarId"
      assert blog_page.pillarName == "some pillarName"
      assert blog_page.sectionId == "some sectionId"
      assert blog_page.sectionName == "some sectionName"
      assert blog_page.type == "some type"
      assert blog_page.webPublicationDate == ~N[2022-03-14 10:00:00]
      assert blog_page.webTitle == "some webTitle"
      assert blog_page.webUrl == "some webUrl"
    end

    test "create_blog_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_blog_page(@invalid_attrs)
    end

    test "update_blog_page/2 with valid data updates the blog_page" do
      blog_page = blog_page_fixture()
      update_attrs = %{apiUrl: "some updated apiUrl", id: "some updated id", pillarId: "some updated pillarId", pillarName: "some updated pillarName", sectionId: "some updated sectionId", sectionName: "some updated sectionName", type: "some updated type", webPublicationDate: ~N[2022-03-15 10:00:00], webTitle: "some updated webTitle", webUrl: "some updated webUrl"}

      assert {:ok, %BlogPage{} = blog_page} = Blog.update_blog_page(blog_page, update_attrs)
      assert blog_page.apiUrl == "some updated apiUrl"
      assert blog_page.id == "some updated id"
      assert blog_page.pillarId == "some updated pillarId"
      assert blog_page.pillarName == "some updated pillarName"
      assert blog_page.sectionId == "some updated sectionId"
      assert blog_page.sectionName == "some updated sectionName"
      assert blog_page.type == "some updated type"
      assert blog_page.webPublicationDate == ~N[2022-03-15 10:00:00]
      assert blog_page.webTitle == "some updated webTitle"
      assert blog_page.webUrl == "some updated webUrl"
    end

    test "update_blog_page/2 with invalid data returns error changeset" do
      blog_page = blog_page_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_blog_page(blog_page, @invalid_attrs)
      assert blog_page == Blog.get_blog_page!(blog_page.id)
    end

    test "delete_blog_page/1 deletes the blog_page" do
      blog_page = blog_page_fixture()
      assert {:ok, %BlogPage{}} = Blog.delete_blog_page(blog_page)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_blog_page!(blog_page.id) end
    end

    test "change_blog_page/1 returns a blog_page changeset" do
      blog_page = blog_page_fixture()
      assert %Ecto.Changeset{} = Blog.change_blog_page(blog_page)
    end
  end

  describe "blogpages" do
    alias LivestBlog.Blog.BlogPage

    import LivestBlog.BlogFixtures

    @invalid_attrs %{apiUrl: nil, pageId: nil, pillarId: nil, pillarName: nil, sectionId: nil, sectionName: nil, type: nil, webPublicationDate: nil, webTitle: nil, webUrl: nil}

    test "list_blogpages/0 returns all blogpages" do
      blog_page = blog_page_fixture()
      assert Blog.list_blogpages() == [blog_page]
    end

    test "get_blog_page!/1 returns the blog_page with given id" do
      blog_page = blog_page_fixture()
      assert Blog.get_blog_page!(blog_page.id) == blog_page
    end

    test "create_blog_page/1 with valid data creates a blog_page" do
      valid_attrs = %{apiUrl: "some apiUrl", pageId: "some pageId", pillarId: "some pillarId", pillarName: "some pillarName", sectionId: "some sectionId", sectionName: "some sectionName", type: "some type", webPublicationDate: ~N[2022-03-14 10:01:00], webTitle: "some webTitle", webUrl: "some webUrl"}

      assert {:ok, %BlogPage{} = blog_page} = Blog.create_blog_page(valid_attrs)
      assert blog_page.apiUrl == "some apiUrl"
      assert blog_page.pageId == "some pageId"
      assert blog_page.pillarId == "some pillarId"
      assert blog_page.pillarName == "some pillarName"
      assert blog_page.sectionId == "some sectionId"
      assert blog_page.sectionName == "some sectionName"
      assert blog_page.type == "some type"
      assert blog_page.webPublicationDate == ~N[2022-03-14 10:01:00]
      assert blog_page.webTitle == "some webTitle"
      assert blog_page.webUrl == "some webUrl"
    end

    test "create_blog_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_blog_page(@invalid_attrs)
    end

    test "update_blog_page/2 with valid data updates the blog_page" do
      blog_page = blog_page_fixture()
      update_attrs = %{apiUrl: "some updated apiUrl", pageId: "some updated pageId", pillarId: "some updated pillarId", pillarName: "some updated pillarName", sectionId: "some updated sectionId", sectionName: "some updated sectionName", type: "some updated type", webPublicationDate: ~N[2022-03-15 10:01:00], webTitle: "some updated webTitle", webUrl: "some updated webUrl"}

      assert {:ok, %BlogPage{} = blog_page} = Blog.update_blog_page(blog_page, update_attrs)
      assert blog_page.apiUrl == "some updated apiUrl"
      assert blog_page.pageId == "some updated pageId"
      assert blog_page.pillarId == "some updated pillarId"
      assert blog_page.pillarName == "some updated pillarName"
      assert blog_page.sectionId == "some updated sectionId"
      assert blog_page.sectionName == "some updated sectionName"
      assert blog_page.type == "some updated type"
      assert blog_page.webPublicationDate == ~N[2022-03-15 10:01:00]
      assert blog_page.webTitle == "some updated webTitle"
      assert blog_page.webUrl == "some updated webUrl"
    end

    test "update_blog_page/2 with invalid data returns error changeset" do
      blog_page = blog_page_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_blog_page(blog_page, @invalid_attrs)
      assert blog_page == Blog.get_blog_page!(blog_page.id)
    end

    test "delete_blog_page/1 deletes the blog_page" do
      blog_page = blog_page_fixture()
      assert {:ok, %BlogPage{}} = Blog.delete_blog_page(blog_page)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_blog_page!(blog_page.id) end
    end

    test "change_blog_page/1 returns a blog_page changeset" do
      blog_page = blog_page_fixture()
      assert %Ecto.Changeset{} = Blog.change_blog_page(blog_page)
    end
  end

  describe "liveblogblocks" do
    alias LivestBlog.Blog.LiveBlogBlock

    import LivestBlog.BlogFixtures

    @invalid_attrs %{content: nil, date: nil, key_event: nil, pinned: nil, title: nil, updated_time: nil}

    test "list_liveblogblocks/0 returns all liveblogblocks" do
      live_blog_block = live_blog_block_fixture()
      assert Blog.list_liveblogblocks() == [live_blog_block]
    end

    test "get_live_blog_block!/1 returns the live_blog_block with given id" do
      live_blog_block = live_blog_block_fixture()
      assert Blog.get_live_blog_block!(live_blog_block.id) == live_blog_block
    end

    test "create_live_blog_block/1 with valid data creates a live_blog_block" do
      valid_attrs = %{content: "some content", date: ~N[2022-03-14 11:02:00], key_event: true, pinned: true, title: "some title", updated_time: ~N[2022-03-14 11:02:00]}

      assert {:ok, %LiveBlogBlock{} = live_blog_block} = Blog.create_live_blog_block(valid_attrs)
      assert live_blog_block.content == "some content"
      assert live_blog_block.date == ~N[2022-03-14 11:02:00]
      assert live_blog_block.key_event == true
      assert live_blog_block.pinned == true
      assert live_blog_block.title == "some title"
      assert live_blog_block.updated_time == ~N[2022-03-14 11:02:00]
    end

    test "create_live_blog_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_live_blog_block(@invalid_attrs)
    end

    test "update_live_blog_block/2 with valid data updates the live_blog_block" do
      live_blog_block = live_blog_block_fixture()
      update_attrs = %{content: "some updated content", date: ~N[2022-03-15 11:02:00], key_event: false, pinned: false, title: "some updated title", updated_time: ~N[2022-03-15 11:02:00]}

      assert {:ok, %LiveBlogBlock{} = live_blog_block} = Blog.update_live_blog_block(live_blog_block, update_attrs)
      assert live_blog_block.content == "some updated content"
      assert live_blog_block.date == ~N[2022-03-15 11:02:00]
      assert live_blog_block.key_event == false
      assert live_blog_block.pinned == false
      assert live_blog_block.title == "some updated title"
      assert live_blog_block.updated_time == ~N[2022-03-15 11:02:00]
    end

    test "update_live_blog_block/2 with invalid data returns error changeset" do
      live_blog_block = live_blog_block_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_live_blog_block(live_blog_block, @invalid_attrs)
      assert live_blog_block == Blog.get_live_blog_block!(live_blog_block.id)
    end

    test "delete_live_blog_block/1 deletes the live_blog_block" do
      live_blog_block = live_blog_block_fixture()
      assert {:ok, %LiveBlogBlock{}} = Blog.delete_live_blog_block(live_blog_block)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_live_blog_block!(live_blog_block.id) end
    end

    test "change_live_blog_block/1 returns a live_blog_block changeset" do
      live_blog_block = live_blog_block_fixture()
      assert %Ecto.Changeset{} = Blog.change_live_blog_block(live_blog_block)
    end
  end
end
