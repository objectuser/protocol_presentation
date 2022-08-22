defmodule BlobStore.DevBlobStore do
  @moduledoc """
  Store blobs in a local process.
  """

  defstruct [:pid]

  alias BlobStore.Blob

  @doc """
  Create a struct holding the process for storing the blobs.
  """
  def new do
    Agent.start_link(fn -> Map.new() end, name: __MODULE__)
  end

  @impl BlobStore.BlobStore
  def put(bucket, name, content) do
    Agent.get_and_update(__MODULE__, fn state ->
      blob = %Blob{bucket: bucket, name: name, content: content}
      {{:ok, blob}, Map.put(state, {bucket, name}, blob)}
    end)
  end

  @impl BlobStore.BlobStore
  def get(bucket, name) do
    Agent.get(__MODULE__, fn state ->
      {:ok, Map.get(state, {bucket, name})}
    end)
  end
end
