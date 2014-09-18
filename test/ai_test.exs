defmodule AiTest do
  use ExUnit.Case

  test "AI keeps a straight flush" do
    hand = [
      %Poker.Card{ value: 7, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 3, suit: :hearts },
      %Poker.Card{ value: 6, suit: :hearts },
      %Poker.Card{ value: 4, suit: :hearts }
    ]
    assert [ [], [
      %Poker.Card{ value: 7, suit: :hearts },
      %Poker.Card{ value: 6, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 4, suit: :hearts },
      %Poker.Card{ value: 3, suit: :hearts }
    ] ] == Poker.Ai.discard hand
  end

  test "AI keeps a straight flush ace low" do
    hand = [
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 3, suit: :hearts },
      %Poker.Card{ value: "A", suit: :hearts },
      %Poker.Card{ value: 4, suit: :hearts },
      %Poker.Card{ value: 2, suit: :hearts }
    ]
    assert [ [], [
      %Poker.Card{ value: "A", suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 4, suit: :hearts },
      %Poker.Card{ value: 3, suit: :hearts },
      %Poker.Card{ value: 2, suit: :hearts }
    ] ] == Poker.Ai.discard hand
  end

  test "AI keeps a four of a kind low kicker" do
    hand = [
      %Poker.Card{ value: 5, suit: :spades },
      %Poker.Card{ value: 5, suit: :clubs },
      %Poker.Card{ value: 5, suit: :diamonds },
      %Poker.Card{ value: 4, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts }
    ]
    assert [ [], [
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 5, suit: :diamonds },
      %Poker.Card{ value: 5, suit: :clubs },
      %Poker.Card{ value: 5, suit: :spades },
      %Poker.Card{ value: 4, suit: :hearts }
    ] ] == Poker.Ai.discard hand
  end

  test "AI keeps a four of a kind high kicker" do
    hand = [
      %Poker.Card{ value: 5, suit: :spades },
      %Poker.Card{ value: 5, suit: :clubs },
      %Poker.Card{ value: 5, suit: :diamonds },
      %Poker.Card{ value: 8, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts }
    ]
    assert [ [], [
      %Poker.Card{ value: 8, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 5, suit: :diamonds },
      %Poker.Card{ value: 5, suit: :clubs },
      %Poker.Card{ value: 5, suit: :spades }
    ] ] == Poker.Ai.discard hand
  end

end
