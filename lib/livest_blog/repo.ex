defmodule LivestBlog.Repo do
  use Ecto.Repo,
    otp_app: :livest_blog,
    adapter: Ecto.Adapters.Postgres
end
