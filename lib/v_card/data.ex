defmodule VCard.Data do
  @moduledoc """
  The VCard data structure. The valid fields, their expected and default values, and vCard 4.0 property mappings:

  ## Fields

    * `:version` - A `String.t()` defining the VCard protocol version.
    Defaults to `"4.0"`. Maps to `VERSION`.

    * `:fn` - A `String.t()` representing the fully qualified name of the individual.
    Defaults to `""`. Maps to `FN`.

    * `:n` - A `VCard.Data.Name` struct representing the component parts of the full name.
    Defaults to a `VCard.Data.Name.t()`. Maps to `N`.

    * `:adr` - A list of `VCard.Data.Adr` structs, each one representing all of the addresses on the card.
    Defaults to a list containing a single default `VCard.Data.Adr.t()`. Each struct in the list
    maps to a separate `ADR` property.

    * `:title` - A `String.t()` representing the title of the individual.
    Defaults to `""`. Maps to `TITLE`.

    * `:role` - A `String.t()` representing the role of the individual in their organization.
    Defaults to `""`. Maps to `ROLE`.

    * `:logo` - A `String.t()` representing the URI of a logo image.
    Defaults to `""`. Maps to `LOGO`.

    * `:org` - A `VCard.Data.Org` struct that contains organization data. Data is separated into three
    levels, from the structural top down: `:organization`, `:division`, and `:subdivision`. Defaults to
    a `VCard.Data.Org.t()`. Maps to `ORG`.

    * `:photo` - A `VCard.Data.Photo` struct that contains a URI value for a photo or image, along with
    metadata on MIME types and image format. Defaults to a `VCard.Data.Photo.t()`. Maps to `PHOTO`.

    * `:source` - A list of `String.t()`, each one identifying the URI of a source of directory information contained
    in the content type. Defaults to `[]`. Each source in the list maps to a separate `SOURCE` property.

    * `:kind` - An `atom` specifying the kind of object the vCard represents. Possible values: `:individual | :group | :org | :location | :"iana-token" | :"x-name"`
    Maps to `KIND`.

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
