defmodule CanonizeWeb.ServicesLive do
  use CanonizeWeb, :live_view

  alias Canonize.Services

  def mount(_params, _session, socket) do
    services = Services.list_services()

    socket = assign(socket, services: services)

    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    Services
    """
  end
end
