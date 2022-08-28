defmodule TestBlobStoreTest do
  use ExUnit.Case

  alias BlobStore
  alias BlobStore.Blob
  alias BlobStore.TestBlobStore

  test "store" do
    blob = %Blob{bucket: "bucket", name: "name", content: "content"}
    blob_store = %TestBlobStore{put_response: {:ok, blob}, get_response: {:ok, blob}}

    assert {:ok, ^blob} = BlobStore.put(blob_store, "bucket", "name", "content")
    assert {:ok, ^blob} = BlobStore.get(blob_store, "bucket", "name")
  end
end
