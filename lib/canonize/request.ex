defmodule Canonize.Request do
  @moduledoc """
  Interface for handling outgoing HTTP and GraphQL requests
  """

  @callback authentication(String.t()) :: {:ok, term} | {:error, term}
  # @callback get() :: {:ok, term} | {:error, String.t()}
end
