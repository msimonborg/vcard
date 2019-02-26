defmodule VCard.Data.OrgTest do
  use ExUnit.Case, async: true
  doctest VCard.Data.Org

  setup do
    {:ok, org: %VCard.Data.Org{}}
  end

  Enum.each(~w(organization division subdivision)a, fn field ->
    test "has a #{field} field that defaults to an empty string", %{org: org} do
      assert org.unquote(field) == ""
    end
  end)
end
