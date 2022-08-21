defmodule BlobStore.AwsS3 do
  defstruct [:access_key_id, :secret_access_key, :region]

  alias BlobStore.Blob
  alias ExAws.S3

  defimpl BlobStore, for: BlobStore.AwsS3 do
    def put(
          %BlobStore.AwsS3{
            access_key_id: access_key_id,
            secret_access_key: secret_access_key,
            region: region
          } = _blob_store,
          bucket,
          name,
          content
        ) do
      S3.put_object(bucket, name, content)
      |> ExAws.request(
        access_key_id: access_key_id,
        secret_access_key: secret_access_key,
        region: region
      )
    end

    def get(
          %BlobStore.AwsS3{
            access_key_id: access_key_id,
            secret_access_key: secret_access_key,
            region: region
          } = _blob_store,
          bucket,
          name
        ) do
      S3.get_object(bucket, name)
      |> ExAws.request(
        access_key_id: access_key_id,
        secret_access_key: secret_access_key,
        region: region
      )
      |> then(fn {:ok, %{body: body}} = _response ->
        %Blob{bucket: bucket, name: name, content: body}
      end)
    end
  end
end
