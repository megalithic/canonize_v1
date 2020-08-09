defmodule CanonizeWeb.ServicesLive do
  use CanonizeWeb, :live_view

  alias Canonize.Services
  alias Canonize.Services.Service

  def mount(_params, _session, socket) do
    services = Services.list_services()
    changeset = Services.change_service(%Service{})

    socket = assign(socket, services: services, changeset: changeset)

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    Services
    """
  end
end
