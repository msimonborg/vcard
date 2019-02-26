defmodule VCard.DataTest do
  use ExUnit.Case, async: true
  doctest VCard.Data

  setup do
    {:ok, vcard: VCard.new}
  end

  Enum.each(~w(role title logo)a, fn field ->
    test "vcard has a #{field} field that defaults to an empty string", %{vcard: vcard} do
      assert vcard.unquote(field) == ""
    end
  end)

  test "data has a :n field that defaults to a VCard.Data.Name struct", %{vcard: vcard} do
    assert %VCard.Data.Name{} = vcard.n
  end

  test "data has a :fn field that defaults to an empty string", %{vcard: vcard} do
    assert vcard.fn == ""
  end

  test "data has a :adr field that defaults to a list with a single VCard.Data.Adr struct", %{vcard: vcard} do
    assert vcard.adr == [%VCard.Data.Adr{}]
  end

  test "data has a :org field that defaults to a VCard.Data.Org struct", %{vcard: vcard} do
    assert %VCard.Data.Org{} = vcard.org
  end

  test "data has a :photo field that defaults to a VCard.Data.Photo struct", %{vcard: vcard} do
    assert %VCard.Data.Photo{} = vcard.photo
  end

  test "data has a list of sources which defaults to an empty list", %{vcard: vcard} do
    assert vcard.source == []
  end

  test "data has a :kind field that returns :individual by default", %{vcard: vcard} do
    assert :individual == vcard.kind
  end
end
