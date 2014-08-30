defmodule PokerTest do
  use ExUnit.Case

  test "can get card's long name" do
    card = %Poker.Card{ value: "A", suit: :hearts }
    assert "Ace of Hearts" == Poker.Card.name(card)
  end

  test "can get card's short name" do
    card = %Poker.Card{ value: "K", suit: :clubs }
    assert "KC" == Poker.Card.short_name(card)
  end
end
