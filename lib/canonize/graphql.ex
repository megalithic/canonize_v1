defmodule Canonize.Graphql do
  @moduledoc """
  GraphQL implementation of the Request module.
  """

  alias Canonize.Request
  @behaviour Request

  @impl Request
  @spec authentication(String.t()) :: {:ok, term} | {:error, term}
  def authentication(token) do
    {:ok, "Bearer #{token}"}
  end

  @spec get(String.t(), String.t()) :: {:ok, term} | {:error, term}
  def get(url, query) do
    {:ok, authorization} = authentication("token")

    case Neuron.query(
           query,
           %{},
           url: url,
           headers: [authorization: authorization]
         ) do
      {:ok, %Neuron.Response{body: %{"data" => data}, status_code: 200, headers: []}} ->
        {:ok, data}

      {:error, error} ->
        {:error, "There was an error getting data from the server (GQL): \r\n#{inspect(error)}"}

      _ ->
        {:error, "There was an unkonwn error getting data from the server (GQL).."}
    end
  end

  @spec post(String.t(), String.t(), Map.t()) :: {:ok, term} | {:error, term}
  def post(url, query, data) do
    {:ok, authorization} = authentication("token")

    Neuron.query(
      query,
      data,
      url: url,
      headers: [authorization: authorization]
    )
  end
end
