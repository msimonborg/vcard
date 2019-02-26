defmodule VCard.Data.PhotoTest do
  use ExUnit.Case, async: true
  doctest VCard.Data.Photo

  setup do
    {:ok, photo: %VCard.Data.Photo{}}
  end

  test "photo has metadata with :mediatype field", %{photo: photo} do
    assert photo.meta.mediatype == "image/gif"
    assert photo.meta.value == "URI"
    assert photo.meta.type == "GIF"
  end

  test "photo has data with :value field", %{photo: photo} do
    assert photo.data.value == ""
  end
end
