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

  test "ace high beats 8 high p1 wins" do
    hands = [TestHelper.ace_high(:p1),
             TestHelper.king_high(:p2) ]
    assert :p1 == Poker.Comparison.determine_winner(hands)
  end

  test "ace high beats 8 high p2 wins" do
    hands = [TestHelper.king_high(:p1),
             TestHelper.ace_high(:p2) ]
    assert :p2 == Poker.Comparison.determine_winner(hands)
  end

  test "both ace high with 2nd cards 9 and 7 p1 wins" do
    hands = [TestHelper.ace_nine_high(:p1),
             TestHelper.ace_seven_high(:p2) ]
    assert :p1 == Poker.Comparison.determine_winner(hands)
  end

  test "both ace high with 2nd cards 7 and 9 p2 wins" do
    hands = [TestHelper.ace_seven_high(:p1),
             TestHelper.ace_nine_high(:p2) ]
    assert :p2 == Poker.Comparison.determine_winner(hands)
  end

  test "high card same hands except last, 3 beats 2" do
    hands = [TestHelper.high_card_3_low(:p1),
             TestHelper.high_card_2_low(:p2) ]
    assert :p1 == Poker.Comparison.determine_winner(hands)
  end

  test "high card same hands except last, 2 beats 3" do
    hands = [TestHelper.high_card_2_low(:p1),
             TestHelper.high_card_3_low(:p2) ]
    assert :p2 == Poker.Comparison.determine_winner(hands)
  end

end
