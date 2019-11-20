defmodule Canonize.HttpTest do
  use ExUnit.Case, async: true

  alias Canonize.Http

  describe "authentication/1" do
    test "returns valid bearer token" do
      input = "foo"
      {:ok, token} = Http.authentication(input)
      assert token == "Bearer #{input}"
    end
  end

  describe "get/2" do
    test "returns a valid HTTP response" do
      assert Http.get("https://api.github.com", "") == {:ok, "yay"}
    end

    test "returns an error if an invalid url is given" do
      assert Http.get("foo", "/bar") ==
               {:error,
                "There was an error getting data from the server (HTTP): \r\n%Mint.TransportError{reason: :nxdomain}"}
    end
  end
end
