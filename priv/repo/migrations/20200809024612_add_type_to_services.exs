defmodule Canonize.Repo.Migrations.AddTypeToServices do
  use Ecto.Migration

  def change do
    alter table(:services) do
      add(:type, :string, null: false)
    end
  end
end
