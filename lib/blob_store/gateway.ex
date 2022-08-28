defmodule BlobStore.Gateway do
  @moduledoc """
  Interface to the blob store.
  """

  alias BlobStore.Blob

  def get_blob(bucket, name) do
    blob_store().get(bucket, name)
  end

  def put_blob(%Blob{bucket: bucket, name: name, content: content}) do
    blob_store().put(bucket, name, content)
  end

  @spec blob_store :: BlobStore.BlobStore
  defp blob_store do
    Application.get_env(:blob_store, :blob_store)
  end
end
