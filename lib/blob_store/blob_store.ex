defprotocol BlobStore do
  def put(blob_store, bucket, name, content)

  def get(blob_store, bucket, name)
end
