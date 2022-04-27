defmodule ArticleApiElixirTest do
  use ExUnit.Case
  doctest ArticleApiElixir

  test "greets the world" do
    assert ArticleApiElixir.hello() == :world
  end
end
