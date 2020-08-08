defmodule Canonize.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :name, :string
    field :server_type_attrs, :map
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :url, :server_type_attrs])
    |> validate_required([:name, :url, :server_type_attrs])
  end
end
