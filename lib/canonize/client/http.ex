defmodule Canonize.Client.Http do
  @moduledoc """
  HTTP client to make RESTful API requests
  """

  @meta %{
    scheme: :https,
    host: "api.github.com",
    port: 443,
    method: "GET",
    path: "/zen",
    headers: []
  }

  def init(meta \\ @meta) do
    {:ok, conn} = connection(meta)
    {:ok, conn, request_ref} = request(conn, meta)

    # receive and parse the response
    receive do
      message ->
        # send received message to `Mint` to be parsed
        {:ok, conn, responses} = Mint.HTTP.stream(conn, message)

        for response <- responses do
          case response do
            {:status, ^request_ref, status_code} ->
              IO.puts("> Response status code #{status_code}")

            {:headers, ^request_ref, headers} ->
              IO.puts("> Response headers: #{inspect(headers)}")

            {:data, ^request_ref, data} ->
              IO.puts("> Response body")
              IO.puts(data)

            {:done, ^request_ref} ->
              IO.puts("> Response fully received")
          end
        end

        Mint.HTTP.close(conn)
    end
  end

  def connection(%{scheme: scheme, host: host, port: port} = _meta) do
    # open a new http connection to api.github.com and get a handle to the connection struct
    {:ok, conn} = Mint.HTTP.connect(_scheme = scheme, _host = host, _port = port)

    {:ok, conn}
  end

  def request(conn, %{method: method, path: path, headers: headers} = _meta) do
    {:ok, conn, request_ref} =
      Mint.HTTP.request(conn, _method = method, _path = path, _headers = headers, _body = nil)

    {:ok, conn, request_ref}
  end

  #   defp recv_response(conn, request_ref, body \\ []) do
  #   end

  # # receive and parse the response till we get a :done mint response
  # defp recv_response(conn, request_ref, body \\ []) do
  #   {conn, body, status} =
  #     receive do
  #       message ->
  # # send received message to `Mint` to be parsed
  #         {:ok, conn, mint_responses} = Mint.HTTP.stream(conn, message)

  # # reduce all the mint responses returning a partial body and status
  #         {body, status} =
  #           Enum.reduce(mint_responses, {body, :incomplete}, fn mint_response, {body, _status} ->
  #             case mint_response do
  # # the :status mint-response doesn't add anything to the body and receiving this
  # # doesn't signify the end of the response, let's ignore this for now.
  #               {:status, ^request_ref, _status_code} ->
  #                 {body, :incomplete}

  # # the :headers mint-response doesn't add anything to the body and receiving this
  # # doesn't signify the end of the response, let's ignore this for now.
  #               {:headers, ^request_ref, _headers} ->
  #                 {body, :incomplete}

  # # the :data mint-response returns a partial body, let us append this
  # # to the end of our accumulator, this still doesn't signify the end
  # # of our response, so let's continue
  #               {:data, ^request_ref, data} ->
  #                 {[ data | body ], :incomplete}

  # # the :done mint-response signifies the end of the response
  #               {:done, ^request_ref} ->
  #                 {Enum.reverse(body), :complete}
  #             end
  #           end)

  #         {conn, body, status}
  #     end
end
