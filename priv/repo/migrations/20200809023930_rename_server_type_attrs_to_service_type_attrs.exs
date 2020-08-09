defmodule Canonize.Repo.Migrations.RenameServerTypeAttrsToServiceTypeAttrs do
  use Ecto.Migration

  def change do
    rename(table("services"), :server_type_attrs, to: :service_type_attrs)
  end
end
