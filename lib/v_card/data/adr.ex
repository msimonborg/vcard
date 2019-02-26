defmodule VCard.Data.Adr do
  defstruct(
    meta: %{
      type: :work,
      pref: false,
      label: ""
    },
    data: %{
      pobox: "",
      ext: "",
      street: "",
      locality: "",
      region: "",
      code: "",
      country: ""
    }
  )

  @type t :: %__MODULE__{
          meta: %{
            type: :work | :home,
            pref: boolean,
            label: String.t()
          },
          data: %{
            pobox: String.t(),
            ext: String.t(),
            street: String.t(),
            locality: String.t(),
            region: String.t(),
            code: String.t(),
            country: String.t()
          }
        }
end
