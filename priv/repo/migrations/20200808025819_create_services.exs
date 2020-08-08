defmodule Canonize.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add(:name, :string)
      add(:url, :string)
      add(:active, :boolean)
      add(:server_type_attrs, :jsonb)

      timestamps()
    end
  end
end
