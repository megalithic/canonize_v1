defmodule Canonize.Http do
  @moduledoc """
  HTTP implementation of the Request module.
  """

  alias Canonize.Request
  @behaviour Request

  @impl Request
  @spec authentication(String.t()) :: {:ok, term} | {:error, term}
  def authentication(token) do
    {:ok, "Bearer #{token}"}
  end

  @spec get(String.t(), String.t()) :: {:ok, term} | {:error, term}
  def get(url, endpoint) do
    {:ok, auth} = authentication("token")

    case(connection(url, endpoint, auth)) do
      {:ok, conn, _} ->
        receive do
          message ->
            Mint.HTTP.stream(conn, message)
            |> IO.inspect(label: "\r\n ----------------- response tuple")
        end

      {:error, error} ->
        {:error, "There was an error getting data from the server (HTTP): \r\n#{inspect(error)}"}

      _ ->
        {:error, "There was an unknown error getting data from the server (HTTP).."}
    end
  end

  defp connection(url, endpoint, auth) do
    case Mint.HTTP.connect(:https, url, 80) do
      {:ok, conn} ->
        Mint.HTTP.request(conn, "GET", endpoint, [{"authorization", auth}], "")

      {:error, error} ->
        {:error, error}
    end
  end
end
