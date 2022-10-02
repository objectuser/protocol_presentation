defmodule BlobStore.AwsS3 do
  @moduledoc """
  Store blobs in AWS S3.
  """

  @behaviour BlobStore.BlobStore

  alias BlobStore.Blob
  alias ExAws.S3

  @impl BlobStore.BlobStore
  def put(bucket, name, content) do
    S3.put_object(bucket, name, content)
    |> ExAws.request(aws_config())
    |> case do
      {:ok, _} ->
        {:ok, %Blob{bucket: bucket, name: name, content: content}}

      error ->
        error
    end
  end

  @impl BlobStore.BlobStore
  def get(bucket, name) do
    S3.get_object(bucket, name)
    |> ExAws.request(aws_config())
    |> case do
      {:ok, %{body: body}} ->
        {:ok, %Blob{bucket: bucket, name: name, content: body}}

      error ->
        error
    end
  end

  defp aws_config do
    Application.get_env(:blob_store, :aws)
  end
end
