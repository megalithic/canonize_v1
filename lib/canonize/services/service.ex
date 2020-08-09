defmodule Canonize.Services.Service do
  use Ecto.Schema
  import Ecto.Changeset

  schema "services" do
    field :name, :string
    field :type, :string, null: false
    field :url, :string
    field :endpoint, :string
    field :username, :string
    field :service_type_attrs, :map, default: %{}
    field :active, :boolean, default: true

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:name, :url, :service_type_attrs, :endpoint, :username, :active, :type])
    |> validate_required([:name, :url, :type])
    |> validate_length(:name, min: 2, max: 100)
  end

  # defp valid_url?(url) do
  #   uri = URI.parse(url)
  #   uri.scheme != nil && uri.host =~ "."
  # end
end
