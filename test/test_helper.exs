ExUnit.start()

defmodule TestHelper do

  def straight_flush(player),  do: { player, _straight_flush }
  def four_of_a_kind(player),  do: { player, _four_of_a_kind }
  def full_house(player),      do: { player, _full_house }
  def flush(player),           do: { player, _flush }
  def straight(player),        do: { player, _straight }
  def three_of_a_kind(player), do: { player, _three_of_a_kind }
  def ace_high(player), do: { player, _ace_high }
  def ace_nine_high(player), do: { player, _ace_high }
  def ace_seven_high(player), do: { player, _ace_seven_high }
  def king_high(player), do: { player, _king_high }
  def high_card_3_low(player), do: { player, _high_card_3_low }
  def high_card_2_low(player), do: { player, _high_card_2_low }

  defp _straight_flush do
    [
      %Poker.Card{ value: 7, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 3, suit: :hearts },
      %Poker.Card{ value: 6, suit: :hearts },
      %Poker.Card{ value: 4, suit: :hearts }
    ]
  end

  defp _four_of_a_kind do
    [
      %Poker.Card{ value: 9, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 9, suit: :spades },
      %Poker.Card{ value: 9, suit: :diamonds },
      %Poker.Card{ value: 9, suit: :clubs }
    ]
  end

  defp _full_house do
    [
      %Poker.Card{ value: 4, suit: :hearts },
      %Poker.Card{ value: 2, suit: :spades },
      %Poker.Card{ value: 4, suit: :diamonds },
      %Poker.Card{ value: 2, suit: :hearts },
      %Poker.Card{ value: 4, suit: :clubs }
    ]
  end

  defp _flush do
    [
      %Poker.Card{ value: 9,   suit: :spades },
      %Poker.Card{ value: 5,   suit: :spades },
      %Poker.Card{ value: 2,   suit: :spades },
      %Poker.Card{ value: "A", suit: :spades },
      %Poker.Card{ value: "J", suit: :spades }
    ]
  end

  defp _straight do
    [
      %Poker.Card{ value: 9, suit: :hearts },
      %Poker.Card{ value: 5, suit: :hearts },
      %Poker.Card{ value: 6, suit: :spades },
      %Poker.Card{ value: 8, suit: :diamonds },
      %Poker.Card{ value: 7, suit: :clubs }
    ]
  end

  defp _three_of_a_kind do
    [
      %Poker.Card{ value: 9, suit: :hearts },
      %Poker.Card{ value: 2, suit: :hearts },
      %Poker.Card{ value: 9, suit: :spades },
      %Poker.Card{ value: 9, suit: :diamonds },
      %Poker.Card{ value: 5, suit: :clubs }
    ]
  end

  defp _ace_high do
    [
      %Poker.Card{ value: "A", suit: :hearts },
      %Poker.Card{ value: 2,   suit: :hearts },
      %Poker.Card{ value: 7,   suit: :spades },
      %Poker.Card{ value: 9,   suit: :diamonds },
      %Poker.Card{ value: 5,   suit: :clubs }
    ]
  end

  defp _ace_seven_high do
    [
      %Poker.Card{ value: "A", suit: :hearts },
      %Poker.Card{ value: 2,   suit: :hearts },
      %Poker.Card{ value: 7,   suit: :spades },
      %Poker.Card{ value: 3,   suit: :diamonds },
      %Poker.Card{ value: 5,   suit: :clubs }
    ]
  end

  defp _king_high do
    [
      %Poker.Card{ value: "K", suit: :hearts },
      %Poker.Card{ value: 2,   suit: :hearts },
      %Poker.Card{ value: 7,   suit: :spades },
      %Poker.Card{ value: 9,   suit: :diamonds },
      %Poker.Card{ value: 5,   suit: :clubs }
    ]
  end

  defp _high_card_3_low do
    [
      %Poker.Card{ value: "K", suit: :hearts },
      %Poker.Card{ value: 3,   suit: :hearts },
      %Poker.Card{ value: 7,   suit: :spades },
      %Poker.Card{ value: 9,   suit: :diamonds },
      %Poker.Card{ value: 5,   suit: :clubs }
    ]
  end

  defp _high_card_2_low do
    [
      %Poker.Card{ value: "K", suit: :hearts },
      %Poker.Card{ value: 2,   suit: :hearts },
      %Poker.Card{ value: 7,   suit: :spades },
      %Poker.Card{ value: 9,   suit: :diamonds },
      %Poker.Card{ value: 5,   suit: :clubs }
    ]
  end

end
