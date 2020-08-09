defmodule CanonizeWeb.ServicesLive do
  use CanonizeWeb, :live_view

  alias Canonize.Services
  alias Canonize.Services.Service

  @service_types Application.get_env(:canonize, :supported_services)

  def mount(_params, _session, socket) do
    services = Services.list_services()
    changeset = Services.change_service(%Service{})

    socket =
      assign(socket, services: services, changeset: changeset, service_types: @service_types)

    {:ok, socket}
  end

  def handle_event("save", %{"service" => params}, socket) do
    case Services.create_service(params) do
      {:ok, service} ->
        socket =
          update(
            socket,
            :services,
            fn services -> [service | services] end
          )

        changeset = Services.change_service(%Service{})

        socket = assign(socket, changeset: changeset)

        :timer.sleep(250)

        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        socket = assign(socket, changeset: changeset)
        {:noreply, socket}
    end
  end

  def handle_event("validate", %{"service" => params}, socket) do
    changeset =
      %Service{}
      |> Services.change_service(params)
      |> Map.put(:action, :insert)

    socket =
      assign(socket,
        changeset: changeset
      )

    {:noreply, socket}
  end
end
