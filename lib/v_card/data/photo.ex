defmodule VCard.Data.Photo do
  @moduledoc """
  Contains the data attributes of the PHOTO VCard field.
  """

  defstruct(
    meta: %{
      mediatype: "image/gif",
      value: "URI",
      type: "GIF"
    },
    data: %{
      value: ""
    }
  )
end
