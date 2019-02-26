defmodule VCardTest do
  use ExUnit.Case, async: true
  doctest VCard

  describe "new/0" do
    test "returns a default VCard.Data struct" do
      assert VCard.new() == %VCard.Data{}
    end
  end

  describe "new/1 returns a VCard.Data struct with customized fields" do
    test "works with keyword lists" do
      assert VCard.new(role: "customized") == %VCard.Data{role: "customized"}
    end

    test "works with maps" do
      assert VCard.new(%{role: "customized"}) == %VCard.Data{role: "customized"}
    end
  end

  describe "update_name/2" do
    setup do
      {:ok, %{vcard: VCard.new()}}
    end

    test "updates the name field", %{vcard: vcard} do
      assert %VCard.Data{
               fn: "full name",
               n: %VCard.Data.Name{data: %{given: ["full"], family: ["name"]}}
             } =
               vcard
               |> VCard.update_name(
                 full_name: "full name",
                 given_names: ["full"],
                 family_names: ["name"]
               )
    end
  end
end
