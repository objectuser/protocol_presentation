defmodule BlobStore.Blob do
  @moduledoc """
  A representation of a blob.
  """

  defstruct [:bucket, :name, :content]
end
