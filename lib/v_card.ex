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
end
