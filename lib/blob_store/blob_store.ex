defprotocol BlobStore do
  @moduledoc """
  Provide blob storage and retrieval.
  """

  alias BlobStore.Blob

  @doc """
  Store an object in the blob store with the given bucket, name and content.
  """
  @spec put(t(), bucket :: String.t(), name :: String.t(), content :: String.t()) ::
          {:ok, Blob.t()} | {:error, any()}
  def put(blob_store, bucket, name, content)

  @doc """
  Get the object from the store for the given bucket and name.
  """
  @spec get(t(), bucket :: String.t(), name :: String.t()) :: {:ok, Blob.t()} | {:error, any()}
  def get(blob_store, bucket, name)
end
