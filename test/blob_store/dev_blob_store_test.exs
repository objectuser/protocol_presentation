defmodule BlobStoreTest do
  use ExUnit.Case

  setup do
    {:ok, _pid} = blob_store().new()
    :ok
  end

  test "store" do
    assert {:ok, blob} = blob_store().put("bucket", "name", "content")
    assert {:ok, ^blob} = blob_store().get("bucket", "name")
  end

  @spec blob_store :: BlobStore.BlobStore
  defp blob_store do
    Application.get_env(:blob_store, :blob_store)
  end
end
