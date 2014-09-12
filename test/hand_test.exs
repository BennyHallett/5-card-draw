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

  test "straight flush ace high is worth 8" do
    hand = [
      %Poker.Card{ value: "J", suit: :hearts },
      %Poker.Card{ value: "A", suit: :hearts },
      %Poker.Card{ value: "K", suit: :hearts },
      %Poker.Card{ value: 10,  suit: :hearts },
      %Poker.Card{ value: "Q", suit: :hearts }
    ]
    assert 8 == Poker.Hand.value hand
  end

  test "straight flush ace low is worth 8" do
    hand = [
      %Poker.Card{ value: 2,   suit: :clubs },
      %Poker.Card{ value: 4,   suit: :clubs },
      %Poker.Card{ value: 3,   suit: :clubs },
      %Poker.Card{ value: "A", suit: :clubs },
      %Poker.Card{ value: 5,   suit: :clubs }
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

  test "full house, high over low is worth 6" do
    hand = [
      %Poker.Card{ value: 7, suit: :hearts },
      %Poker.Card{ value: 7, suit: :spades },
      %Poker.Card{ value: 7, suit: :diamonds },
      %Poker.Card{ value: 2, suit: :spades },
      %Poker.Card{ value: 2, suit: :clubs }
    ]
    assert 6 == Poker.Hand.value hand
  end

  test "full house, low over high is worth 6" do
    hand = [
      %Poker.Card{ value: "J", suit: :hearts },
      %Poker.Card{ value: 3, suit: :spades },
      %Poker.Card{ value: "J", suit: :diamonds },
      %Poker.Card{ value: 3, suit: :diamonds },
      %Poker.Card{ value: 3, suit: :clubs }
    ]
    assert 6 == Poker.Hand.value hand
  end

  test "flush is worth 5" do
    hand = [
      %Poker.Card{ value: "J", suit: :hearts },
      %Poker.Card{ value: 5,   suit: :hearts },
      %Poker.Card{ value: "A", suit: :hearts },
      %Poker.Card{ value: 8,   suit: :hearts },
      %Poker.Card{ value: 6,   suit: :hearts }
    ]
    assert 5 == Poker.Hand.value hand
  end

  test "straight is worth 4" do
    hand = [
      %Poker.Card{ value: 8, suit: :hearts },
      %Poker.Card{ value: 5, suit: :spades },
      %Poker.Card{ value: 9, suit: :spades },
      %Poker.Card{ value: 7, suit: :diamonds },
      %Poker.Card{ value: 6, suit: :clubs }
    ]
    assert 4 == Poker.Hand.value hand
  end

  test "straight with ace high is worth 4" do
    hand = [
      %Poker.Card{ value: "Q", suit: :hearts },
      %Poker.Card{ value: 10,  suit: :spades },
      %Poker.Card{ value: "A", suit: :spades },
      %Poker.Card{ value: "K", suit: :diamonds },
      %Poker.Card{ value: "J", suit: :clubs }
    ]
    assert 4 == Poker.Hand.value hand
  end

  test "straight with ace low is worth 4" do
    hand = [
      %Poker.Card{ value: 5,   suit: :hearts },
      %Poker.Card{ value: 2,   suit: :spades },
      %Poker.Card{ value: "A", suit: :spades },
      %Poker.Card{ value: 3,   suit: :diamonds },
      %Poker.Card{ value: 4,   suit: :clubs }
    ]
    assert 4 == Poker.Hand.value hand
  end

  test "three of a kind is worth 3, both low" do
    hand = [
      %Poker.Card{ value: 8, suit: :hearts },
      %Poker.Card{ value: 5, suit: :spades },
      %Poker.Card{ value: 8, suit: :spades },
      %Poker.Card{ value: 8, suit: :diamonds },
      %Poker.Card{ value: 2, suit: :clubs }
    ]
    assert 3 == Poker.Hand.value hand
  end

  test "three of a kind is worth 3, both high" do
    hand = [
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 8, suit: :spades },
      %Poker.Card{ value: 5, suit: :spades },
      %Poker.Card{ value: 5, suit: :diamonds },
      %Poker.Card{ value: "A", suit: :clubs }
    ]
    assert 3 == Poker.Hand.value hand
  end

  test "three of a kind is worth 3, low/high" do
    hand = [
      %Poker.Card{ value: "J", suit: :hearts },
      %Poker.Card{ value: "A", suit: :spades },
      %Poker.Card{ value: "J", suit: :spades },
      %Poker.Card{ value: "J", suit: :diamonds },
      %Poker.Card{ value: 7,   suit: :clubs }
    ]
    assert 3 == Poker.Hand.value hand
  end

  test "two pair low kicker is worth 2" do
    hand = [
      %Poker.Card{ value: 8, suit: :hearts },
      %Poker.Card{ value: 5, suit: :spades },
      %Poker.Card{ value: 8, suit: :spades },
      %Poker.Card{ value: 5, suit: :diamonds },
      %Poker.Card{ value: 2, suit: :clubs }
    ]
    assert 2 == Poker.Hand.value hand
  end

  test "two pair mid kicker is worth 2" do
    hand = [
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 8, suit: :spades },
      %Poker.Card{ value: 5, suit: :spades },
      %Poker.Card{ value: 8, suit: :diamonds },
      %Poker.Card{ value: 7, suit: :clubs }
    ]
    assert 2 == Poker.Hand.value hand
  end

  test "two pair high kicker is worth 2" do
    hand = [
      %Poker.Card{ value: "J", suit: :hearts },
      %Poker.Card{ value: "Q", suit: :spades },
      %Poker.Card{ value: "J", suit: :spades },
      %Poker.Card{ value: "Q", suit: :diamonds },
      %Poker.Card{ value: "A", suit: :clubs }
    ]
    assert 2 == Poker.Hand.value hand
  end

  test "one pair none higher" do
    hand = [
      %Poker.Card{ value: "J", suit: :hearts },
      %Poker.Card{ value: 5,   suit: :spades },
      %Poker.Card{ value: "J", suit: :spades },
      %Poker.Card{ value: 4,   suit: :diamonds },
      %Poker.Card{ value: 8,   suit: :clubs }
    ]
    assert 1 == Poker.Hand.value hand
  end

  test "one pair one higher" do
    hand = [
      %Poker.Card{ value: "J", suit: :hearts },
      %Poker.Card{ value: "Q", suit: :spades },
      %Poker.Card{ value: "J", suit: :spades },
      %Poker.Card{ value: 8,   suit: :diamonds },
      %Poker.Card{ value: 3,   suit: :clubs }
    ]
    assert 1 == Poker.Hand.value hand
  end

  test "one pair two higher" do
    hand = [
      %Poker.Card{ value: 8,   suit: :hearts },
      %Poker.Card{ value: "Q", suit: :spades },
      %Poker.Card{ value: "K", suit: :spades },
      %Poker.Card{ value: "Q", suit: :diamonds },
      %Poker.Card{ value: "A", suit: :clubs }
    ]
    assert 1 == Poker.Hand.value hand
  end

  test "one pair three higher" do
    hand = [
      %Poker.Card{ value: 9,   suit: :hearts },
      %Poker.Card{ value: 7,   suit: :spades },
      %Poker.Card{ value: "A", suit: :spades },
      %Poker.Card{ value: 4,   suit: :diamonds },
      %Poker.Card{ value: 4,   suit: :clubs }
    ]
    assert 1 == Poker.Hand.value hand
  end

  test "high card is worth 0" do
    hand = [
      %Poker.Card{ value: 9,   suit: :hearts },
      %Poker.Card{ value: 7,   suit: :spades },
      %Poker.Card{ value: "A", suit: :spades },
      %Poker.Card{ value: "J", suit: :diamonds },
      %Poker.Card{ value: 2,   suit: :clubs }
    ]
    assert 0 == Poker.Hand.value hand
  end

end
