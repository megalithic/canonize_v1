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
    {:ok, authorization} = authentication("token")
    {:ok, conn} = Mint.HTTP.connect(:https, url, 80)

    {:ok, conn, _request_ref} =
      Mint.HTTP.request(conn, "GET", endpoint, [{"authorization", authorization}], "")

    receive do
      message ->
        Mint.HTTP.stream(conn, message)
        |> IO.inspect(label: "\r\n ----------------- response tuple")
    end
  end
end
