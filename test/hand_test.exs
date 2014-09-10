defmodule HandTest do
  use ExUnit.Case

  test "straight flush is worth 8" do
    hand = [
      %Poker.Card{ value: 7, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 3, suit: :hearts },
      %Poker.Card{ value: 6, suit: :hearts },
      %Poker.Card{ value: 4, suit: :hearts }
    ]
    assert 8 == Poker.Hand.value hand
  end

  test "four of a kind with lower kicker is worth 7" do
    hand = [
      %Poker.Card{ value: "A", suit: :hearts },
      %Poker.Card{ value: "A", suit: :spades },
      %Poker.Card{ value: 2, suit: :diamonds },
      %Poker.Card{ value: "A", suit: :diamonds },
      %Poker.Card{ value: "A", suit: :clubs }
    ]
    assert 7 == Poker.Hand.value hand
  end

  test "four of a kind with higher kicker is worth 7" do
    hand = [
      %Poker.Card{ value: "Q", suit: :hearts },
      %Poker.Card{ value: "Q", suit: :spades },
      %Poker.Card{ value: "Q", suit: :diamonds },
      %Poker.Card{ value: "A", suit: :spades },
      %Poker.Card{ value: "Q", suit: :clubs }
    ]
    assert 7 == Poker.Hand.value hand
  end
end
