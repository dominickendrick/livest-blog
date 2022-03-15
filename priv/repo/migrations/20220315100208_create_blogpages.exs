defmodule LivestBlog.Repo.Migrations.CreateBlogpages do
  use Ecto.Migration

  def change do
    create table(:blogpages) do
      add :pageId, :string
      add :type, :string
      add :sectionId, :string
      add :sectionName, :string
      add :webPublicationDate, :naive_datetime
      add :webTitle, :string
      add :webUrl, :string
      add :apiUrl, :string
      add :pillarId, :string
      add :pillarName, :string

      timestamps()
    end
  end
end
