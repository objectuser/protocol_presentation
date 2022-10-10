defmodule BlobStore.Gateway do
  @moduledoc """
  Interface to the blob store.
  """

  alias BlobStore.Blob

  @doc """
  Get a blob, identified by the given bucket and name, from the blob store.
  """
  @spec get_blob(BlobStore.t(), bucket :: String.t(), name :: String.t()) ::
          {:ok, Blob.t()} | {:error, any()}
  def get_blob(blob_store, bucket, name) do
    BlobStore.get(blob_store, bucket, name)
  end

  @doc """
  Store a new blob from the blob store.
  """
  @spec put_blob(BlobStore.t(), Blob.t()) :: {:ok, Blob.t()} | {:error, any()}
  def put_blob(blob_store, %Blob{bucket: bucket, name: name, content: content}) do
    BlobStore.put(blob_store, bucket, name, content)
  end
end
