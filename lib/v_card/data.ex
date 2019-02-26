defmodule VCard.Data do
  @moduledoc """
  The VCard data structure. The valid fields, their expected and default values, and vCard 4.0 property mappings:

  ## Fields

    * `:version` - A `String.t()` defining the VCard protocol version.
    Defaults to `"4.0"`. Maps to `VERSION`.

    * `:fn` - A `String.t()` representing the fully qualified name of the individual.
    Defaults to `""`. Maps to `FN`.

    * `:n` - A `VCard.Data.Name` struct representing the component parts of the full name.
    Defaults to a default `VCard.Data.Name.t()`. Maps to `N`.

    * `:adr` - A list of `VCard.Data.Adr` structs, each one representing all of the addresses on the card.
    Defaults to a list containing a single default `VCard.Data.Adr.t()`. Each struct in the list
    maps to a separate `ADR` property.

    * `:title` - A `String.t()` representing the title of the individual.
    Defaults to `""`. Maps to `TITLE`.

  """

  @doc """
  The VCard struct stores the data to be encoded into a VCard string, or vice versa.
  """
  defstruct(
    version: "4.0",
    fn: "",
    n: %VCard.Data.Name{},
    adr: [%VCard.Data.Adr{}],
    title: "",
    role: "",
    logo: "",
    org: %VCard.Data.Org{},
    photo: %VCard.Data.Photo{},
    source: [],
    kind: :individual
  )

  @type t :: %__MODULE__{
          version: String.t(),
          fn: String.t(),
          n: VCard.Data.Name.t(),
          adr: [VCard.Data.Adr.t()],
          title: String.t(),
          role: String.t(),
          logo: String.t(),
          org: VCard.Data.Name.t(),
          photo: VCard.Data.Photo.t(),
          source: [String.t()],
          kind: :individual | :group | :org | :location | :"iana-token" | :"x-name"
        }
end
