defmodule VCard.Data.NameTest do
  use ExUnit.Case, async: true
  doctest VCard.Data.Name

  setup do
    {:ok, name: %VCard.Data.Name{}}
  end

  describe ":data" do
    Enum.each(~w(family given additional suffixes prefixes)a, fn field ->
      test ":data has a #{field} field that defaults to an empty list", %{name: name} do
        assert name.data.unquote(field) == []
      end
    end)
  end
end
