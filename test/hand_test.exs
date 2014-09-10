defmodule HandTest do
  use ExUnit.Case

  test "straight flush is worth 15" do
    hand = [
      %Poker.Card{ value: 7, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 3, suit: :hearts },
      %Poker.Card{ value: 6, suit: :hearts },
      %Poker.Card{ value: 4, suit: :hearts }
    ]
    assert 15 == Poker.Hand.value hand
  end
end
