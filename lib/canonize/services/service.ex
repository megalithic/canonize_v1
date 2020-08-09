defmodule Canonize.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :name, :string
    field :service_type_attrs, :map, default: %{}
    field :url, :string
    field :endpoint, :string
    field :username, :string
    field :active, :boolean, default: true
    field :type, :string, null: false

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :url, :service_type_attrs, :endpoint, :username, :active, :type])
    |> validate_required([:name, :url, :type])
  end
end
