defmodule BlobStore.AwsS3 do
  @moduledoc """
  Store blobs in AWS S3.
  """

  defstruct [:access_key_id, :secret_access_key, :region]

  alias BlobStore.Blob
  alias ExAws.S3

  defimpl BlobStore do
    def put(blob_store, bucket, name, content) do
      S3.put_object(bucket, name, content)
      |> request(blob_store)
      |> case do
        {:ok, _} -> {:ok, %Blob{bucket: bucket, name: name, content: content}}
        error -> error
      end
    end

    def get(blob_store, bucket, name) do
      S3.get_object(bucket, name)
      |> request(blob_store)
      |> case do
        {:ok, %{body: body}} -> {:ok, %Blob{bucket: bucket, name: name, content: body}}
        error -> error
      end
    end

    defp request(operation, %BlobStore.AwsS3{
           access_key_id: access_key_id,
           secret_access_key: secret_access_key,
           region: region
         }) do
      ExAws.request(operation,
        access_key_id: access_key_id,
        secret_access_key: secret_access_key,
        region: region
      )
    end
  end
end
