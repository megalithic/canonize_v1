defmodule Canonize.Client.Http do
  @moduledoc """
  HTTP client to make RESTful API requests

  Presently, a wrapper around the most excellent Finch.
  """

  #   alias Finch.Response

  use Agent

  def init(config, client, pool_size) do
    Agent.start_link(
      fn ->
        %{
          config: config,
          client: client,
          pool_size: pool_size
        }
      end,
      name: __MODULE__
    )

    {Finch,
     name: client,
     pools: %{
       config.url => [size: pool_size]
     }}
  end

  def request(method, path, headers, body) do
    config =
      get(:config)
      |> IO.inspect(label: "get config")

    client =
      get(:client)
      |> IO.inspect(label: "get client")

    method
    |> Finch.build("#{config.url}#{path}", headers, body)
    |> Finch.request(client)
  end

  def request(method, path, headers) do
    config =
      get(:config)
      |> IO.inspect(label: "get config")

    client =
      get(:client)
      |> IO.inspect(label: "get client")

    method
    |> Finch.build("#{config.url}#{path}", headers)
    |> Finch.request(client)
  end

  def request(method, path) do
    config =
      get(:config)
      |> IO.inspect(label: "get config")

    client =
      get(:client)
      |> IO.inspect(label: "get client")

    method
    |> Finch.build("#{config.url}#{path}")
    |> Finch.request(client)
  end

  defp get(key) do
    Agent.get(__MODULE__, & &1)
    |> Map.get(key)
  end

  defp get() do
    Agent.get(__MODULE__, & &1)
  end
end
