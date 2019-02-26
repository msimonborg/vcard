defmodule VCard.Data.Org do
  @moduledoc """
  Contains the data describing an organization and its subdivisions.
  """
  defstruct organization: "", division: "", subdivision: ""

  @type t :: %__MODULE__{organization: String.t(), division: String.t(), subdivision: String.t()}
end
