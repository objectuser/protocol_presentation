defmodule BlobStore.TestBlobStore do
  @moduledoc """
  A blob store with a struct that specifies the response.
  """

  defstruct [:get_response, :put_response]

  alias BlobStore.TestBlobStore

  @doc """
  Create a struct using the given options:
  - `get_response`: the response for the "get" operation
  - `put_response`: the response for the "put" operation
  """
  def new(opts) do
    opts
    |> Map.new()
    |> then(&struct(TestBlobStore, &1))
  end

  defimpl BlobStore, for: BlobStore.TestBlobStore do
    def put(%TestBlobStore{put_response: put_response} = _blob_store, _bucket, _name, _content) do
      put_response
    end

    def get(%TestBlobStore{get_response: get_response} = _blob_store, _bucket, _name) do
      get_response
    end
  end
end
