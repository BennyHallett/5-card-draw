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

  test "4 is less than 9" do
    four = %Poker.Card{ value: 4, suit: :diamonds }
    nine = %Poker.Card{ value: 9, suit: :spades }

    assert -1 == Poker.Card.compare four, nine
  end

  test "Jack is more than 5" do
    ten = %Poker.Card{ value: "J", suit: :clubs }
    five = %Poker.Card{ value: 5, suit: :hearts }

    assert 1 == Poker.Card.compare ten, five
  end

  test "Ace is more than King" do
    ace = %Poker.Card{ value: "A", suit: :diamonds }
    king = %Poker.Card{ value: "K", suit: :hearts }

    assert 1 == Poker.Card.compare ace, king
  end

  test "Queens are equal" do
    qh = %Poker.Card{ value: "Q", suit: :hearts }
    qs = %Poker.Card{ value: "Q", suit: :spades }

    assert 0 == Poker.Card.compare qh, qs
  end
end
