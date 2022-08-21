defmodule BlobStore.DevBlobStore do
  defstruct [:pid]

  alias BlobStore.DevBlobStore

  def new do
    {:ok, pid} = Agent.start_link(fn -> Map.new() end)
    %DevBlobStore{pid: pid}
  end

  defimpl BlobStore, for: BlobStore.DevBlobStore do
    alias BlobStore.Blob

    def put(%DevBlobStore{pid: pid} = _blob_store, bucket, name, content) do
      Agent.get_and_update(pid, fn state ->
        blob = %Blob{bucket: bucket, name: name, content: content}
        {{:ok, blob}, Map.put(state, {bucket, name}, blob)}
      end)
    end

    def get(%DevBlobStore{pid: pid} = _blob_store, bucket, name) do
      Agent.get(pid, fn state ->
        {:ok, Map.get(state, {bucket, name})}
      end)
    end
  end
end
