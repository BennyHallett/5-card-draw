defmodule DeckTest do
  use ExUnit.Case

  test "deck contains 52 unique cards" do
    deck = Poker.Deck.new
    assert 52 == Enum.count(deck)
    assert 52 == deck |> Enum.uniq |> Enum.count
  end

  test "can shuffle deck" do
    deck = Poker.Deck.new

    assert deck != Poker.Deck.shuffle(deck)
  end
end
