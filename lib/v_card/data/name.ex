defmodule VCard.Data.Name do
  defstruct(
    data: %{
      family: [],
      given: [],
      additional: [],
      prefixes: [],
      suffixes: []
    }
  )

  @type t :: %__MODULE__{
          data: %{
            family: [String.t()],
            given: [String.t()],
            additional: [String.t()],
            prefixes: [String.t()],
            suffixes: [String.t()]
          }
        }
end
