defmodule ComparisonTest do
  use ExUnit.Case

  test "straight flush beats four of a kind" do
    hands = [TestHelper.four_of_a_kind(:player1), TestHelper.straight_flush(:player2)]
    assert :player2 == Poker.Comparison.determine_winner(hands)
  end

  test "full house wins in 4 handed game" do
    hands = [TestHelper.flush(:player1),
             TestHelper.three_of_a_kind(:player2),
             TestHelper.straight(:player3),
             TestHelper.full_house(:player4)]
    assert :player4 == Poker.Comparison.determine_winner(hands)
  end

end
