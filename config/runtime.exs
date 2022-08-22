import Config

case Config.config_env() do
  :prod ->
    config :blob_store,
      blob_store: BlobStore.AwsS3,
      aws: [
        access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
        secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
        region: System.get_env("AWS_REGION")
      ]

  :dev ->
    config :blob_store, blob_store: BlobStore.DevBlobStore.new()

  :test ->
    config :blob_store, blob_store: BlobStore.DevBlobStore.new()
end
