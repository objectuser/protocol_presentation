defmodule BlobStore.GatewayTest do
  use ExUnit.Case

  alias BlobStore.Blob
  alias BlobStore.Gateway
  alias BlobStore.TestBlobStore

  test "put/get" do
    blob = %Blob{bucket: "bucket", name: "name", content: "content"}
    blob_store = TestBlobStore.new(put_response: {:ok, blob}, get_response: {:ok, blob})

    assert {:ok, ^blob} = Gateway.put_blob(blob_store, blob)
    assert {:ok, ^blob} = Gateway.get_blob(blob_store, "bucket", "name")
  end
end
