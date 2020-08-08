defmodule Canonize.Repo.Migrations.AddEndpointToServices do
  use Ecto.Migration

  def change do
    alter table(:services) do
      add(:endpoint, :string, default: "")
    end
  end
end
