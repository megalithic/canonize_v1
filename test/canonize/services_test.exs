defmodule Canonize.ServicesTest do
  use Canonize.DataCase

  alias Canonize.Services

  describe "services" do
    alias Canonize.Services.Service

    @valid_attrs %{
      name: "some name",
      service_type_attrs: %{},
      url: "some url",
      type: "some type",
      username: "some username",
      endpoint: "some endpoint"
    }
    @update_attrs %{
      name: "some updated name",
      service_type_attrs: %{},
      url: "some updated url",
      endpoint: "some updated endpoint",
      username: "some updated username"
    }
    @invalid_attrs %{name: nil, service_type_attrs: nil, url: nil, type: nil}

    def service_fixture(attrs \\ %{}) do
      {:ok, service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Services.create_service()

      service
    end

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Services.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Services.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      assert {:ok, %Service{} = service} = Services.create_service(@valid_attrs)
      assert service.name == "some name"
      assert service.service_type_attrs == %{}
      assert service.url == "some url"
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Services.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      assert {:ok, %Service{} = service} = Services.update_service(service, @update_attrs)
      assert service.name == "some updated name"
      assert service.service_type_attrs == %{}
      assert service.url == "some updated url"
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Services.update_service(service, @invalid_attrs)
      assert service == Services.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Services.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Services.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Services.change_service(service)
    end
  end
end
