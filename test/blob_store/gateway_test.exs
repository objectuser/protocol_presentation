defmodule BlobStore.GatewayTest do
  use ExUnit.Case

  alias BlobStore.Blob
  alias BlobStore.Gateway

  setup do
    {:ok, _pid} = blob_store().new()
    :ok
  end

  test "put/get" do
    blob = %Blob{bucket: "bucket", name: "name", content: "content"}

    assert {:ok, ^blob} = Gateway.put_blob(blob)
    assert {:ok, ^blob} = Gateway.get_blob("bucket", "name")
  end

  @spec blob_store :: BlobStore.BlobStore
  defp blob_store do
    Application.get_env(:blob_store, :blob_store)
  end
end
