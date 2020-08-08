defmodule Canonize.Repo.Migrations.AddUsernameToServices do
  use Ecto.Migration

  def change do
    alter table(:services) do
      add(:username, :string, default: "")
    end
  end
end
