defmodule VCard do
  @moduledoc """
  Encode and decode VCard text files.
  """

  @doc """
  Returns a `VCard.Data` struct.

  ## Examples

      iex> VCard.new
      %VCard.Data{}

  """
  @spec new() :: VCard.Data.t()
  def new, do: %VCard.Data{}

  @doc """
  Returns a `VCard.Data` struct with updated fields.

  A map or keyword list must be passed with key-value pairs describing the updates.
  Keys must be valid `%VCard.Data{}` fields or the function raises a `KeyError`.

  See `VCard.Data` for a full list of valid fields.

  ## Examples

      iex> VCard.new(role: "a custom role")
      %VCard.Data{role: "a custom role"}

      iex> VCard.new(%{role: "maps work too"})
      %VCard.Data{role: "maps work too"}

      iex> VCard.new(not_valid: "will raise an exception")
      ** (KeyError) key :not_valid not found

  """
  @spec new(map | keyword) :: VCard.Data.t()
  def new(opts) when is_map(opts) or is_list(opts) do
    Enum.reduce(opts, new(), fn {k, v}, vcard -> %{vcard | k => v} end)
  end

  @doc """
  Updates the name fields in a `VCard.Data` struct.

  ## Options

    * `:full_name` - Expects a string defining the fully qualified name.
    * `:given_names`, `:family_names`, `:additional_names`, `:prefixes`, `:suffixes` - Each of these options
    are expected to be a list of strings so multiple values can be encoded -- e.g. a person can have more than
    one given name so they are passed as a list, even if there is only one value.

  ## Examples

      iex> opts = [full_name: "full name", given_names: ["full"], family_names: ["name"]]
      iex> VCard.new |> VCard.update_name(opts)
      %VCard.Data{
        fn: "full name",
        n: %VCard.Data.Name{
          data: %{
            given: ["full"], family: ["name"], additional: [], prefixes: [], suffixes: []
          }
        }
      }

  """
  @spec update_name(VCard.Data.t(), keyword) :: VCard.Data.t()
  def update_name(vcard, opts) when is_list(opts) do
    {full, opts} = Keyword.pop(opts, :full_name, vcard.fn)
    {family, opts} = Keyword.pop(opts, :family_names, vcard.n.data.family)
    {given, opts} = Keyword.pop(opts, :given_names, vcard.n.data.given)
    {additional, opts} = Keyword.pop(opts, :additional_names, vcard.n.data.additional)
    {prefixes, opts} = Keyword.pop(opts, :prefixes, vcard.n.data.prefixes)
    {suffixes, _} = Keyword.pop(opts, :suffixes, vcard.n.data.suffixes)

    data = %{
      vcard.n.data
      | family: family,
        given: given,
        additional: additional,
        prefixes: prefixes,
        suffixes: suffixes
    }

    %{vcard | fn: full, n: %{vcard.n | data: data}}
  end
end
