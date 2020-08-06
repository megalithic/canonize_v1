defmodule Canonize.Services.Github do
  @moduledoc """
  HTTP client to make requests with Github's RESTful API
  """

  @config Application.get_env(:canonize, :services)[:github]

  alias Canonize.Client.Http
  alias Finch.Response

  def pool_size, do: 25

  def child_spec() do
    Http.init(@config, __MODULE__, pool_size())
  end

  def get_items() do
    :get
    |> Http.request("/users/#{@config.username}/starred")
    |> handle_response()
    |> get_repo_urls()
  end

  defp handle_response({:ok, %Response{body: body}}) do
    items =
      body
      |> Jason.decode!()

    {:ok, items}
  end

  defp get_repo_urls({:ok, items}) do
    repo_urls =
      items
      |> Enum.map(fn item ->
        item["html_url"]
      end)

    {:ok, repo_urls}
  end
end
