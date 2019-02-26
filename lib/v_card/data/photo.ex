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

  @type t :: %__MODULE__{
          meta: %{
            mediatype: String.t(),
            value: String.t(),
            type: String.t()
          },
          data: %{
            value: String.t()
          }
        }
end
