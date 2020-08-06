defmodule Canonize.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Canonize.Repo,
      # Start the Telemetry supervisor
      CanonizeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Canonize.PubSub},
      # Start the Endpoint (http/https)
      CanonizeWeb.Endpoint,
      # Start a worker by calling: Canonize.Worker.start_link(arg)
      # {Canonize.Worker, arg}

      # Canonize.Services.Reddit.child_spec(),
      # Canonize.Services.Twitter.child_spec(),
      Canonize.Services.Github.child_spec()
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Canonize.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CanonizeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
