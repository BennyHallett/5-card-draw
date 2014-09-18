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

end
