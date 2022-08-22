defmodule BlobStore.Blob do
  @moduledoc """
  A representation of a blob.
  """

  @type t :: %__MODULE__{}
  defstruct [:bucket, :name, :content]
end
