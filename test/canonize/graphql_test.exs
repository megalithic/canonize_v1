defmodule Canonize.GraphqlTest do
  use ExUnit.Case, async: true

  alias Canonize.Graphql

  describe "authentication/1" do
    test "returns valid bearer token" do
      input = "foo"
      {:ok, token} = Graphql.authentication(input)
      assert token == "Bearer #{input}"
    end
  end

  describe "get/2" do
    test "returns a valid GraphQL response" do
      data = %{}
      assert Graphql.get("foo", "") == {:ok, data}
    end

    test "returns an error if an invalid url is given" do
      error =
        "There was an error getting data from the server (GQL): \r\n%HTTPoison.Error{id: nil, reason: :nxdomain}"

      assert Graphql.get("foo", "") == {:error, error}
    end
  end
end
