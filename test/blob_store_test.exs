defmodule BlobStoreTest do
  use ExUnit.Case

  alias BlobStore
  alias BlobStore.DevBlobStore

  test "store" do
    blob_store = DevBlobStore.new()

    assert {:ok, blob} = BlobStore.put(blob_store, "bucket", "name", "content")
    assert {:ok, ^blob} = BlobStore.get(blob_store, "bucket", "name")
  end
end
