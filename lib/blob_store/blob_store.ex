defmodule BlobStore.BlobStore do
  @moduledoc """
  Provide blob storage and retrieval.
  """

  alias BlobStore.Blob

  @doc """
  Put an object in the store with the given bucket, name and content.
  """
  @callback put(bucket :: String.t(), name :: String.t(), content :: String.t()) ::
              {:ok, Blob.t()} | {:error, any()}

  @doc """
  Get the object from the bucket with the given name.
  """
  @callback get(bucket :: String.t(), name :: String.t()) :: {:ok, Blob.t()} | {:error, any()}
end
