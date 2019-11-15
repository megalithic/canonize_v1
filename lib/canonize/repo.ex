defmodule Canonize.Repo do
  use Ecto.Repo,
    otp_app: :canonize,
    adapter: Ecto.Adapters.Postgres
end
