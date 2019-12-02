defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_desk creates 20 cards" do
    assert length(Cards.create_deck) == 20
  end
  
  test "shuffeling a deck randomizes it" do
    deck = Cards.create_deck
    new_deck = Cards.shuffle(deck)
    assert length(deck) == length(new_deck)
    refute deck == new_deck
  end
end
