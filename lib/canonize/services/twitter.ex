defmodule Canonize.Services.Twitter do
  @moduledoc """
  HTTP client to make requests with Reddit's RESTful API
  """

  @config Application.get_env(:canonize, :services)[:twitter]

  alias Canonize.Client.Http
  # alias Finch.Response

  def pool_size, do: 25

  def child_spec() do
    Http.init(@config, __MODULE__, pool_size())
  end

  # def get_saved_items() do
  #   :get
  #   |> request("/user/defsuqad/saved.json")
  #   |> handle_response()
  #   |> get_saved_item_text()
  # end

  # defp handle_response({:ok, %Response{body: body}}) do
  #   IO.inspect(body, label: "response body")

  #   saved_items =
  #     body
  #     |> Jason.decode!()
  #     |> Map.get("data")

  #   {:ok, saved_items}
  # end

  # defp get_saved_item_text({:ok, %Response{body: body}}) do
  #   body
  #   |> Jason.decode!()
  #   |> case do
  #     %{"text" => text} -> String.downcase(text)
  #     _ -> ""
  #   end
  # end
end
