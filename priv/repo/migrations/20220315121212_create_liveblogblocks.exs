defmodule LivestBlog.Repo.Migrations.CreateLiveblogblocks do
  use Ecto.Migration

  def change do
    create table(:liveblogblocks) do
      add :date, :naive_datetime
      add :title, :string
      add :content, :string
      add :pinned, :boolean, default: false, null: false
      add :key_event, :boolean, default: false, null: false
      add :updated_time, :naive_datetime
      add :blogpage_id, references(:blogpages, on_delete: :nothing)

      timestamps()
    end

    create index(:liveblogblocks, [:blogpage_id])
  end
end
