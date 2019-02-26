defmodule VCard.Data.AdrTest do
  use ExUnit.Case, async: true
  doctest VCard.Data.Adr

  setup do
    {:ok, adr: %VCard.Data.Adr{}}
  end

  describe "metadata" do
    test "adr metadata has a :type field that defaults to :work", %{adr: adr} do
      assert adr.meta.type == :work
    end

    test "adr metadata has a :pref field that defaults to false", %{adr: adr} do
      assert adr.meta.pref == false
    end

    test "adr metadata has a :label field that defaults to an empty string", %{
      adr: adr
    } do
      assert adr.meta.label == ""
    end
  end

  describe "data" do
    Enum.each(~w(pobox ext street locality region code country)a, fn field ->
      test "adr data has a #{field} field that defaults to an empty string", %{
        adr: adr
      } do
        assert adr.data.unquote(field) == ""
      end
    end)
  end
end
