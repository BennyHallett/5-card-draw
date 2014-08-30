defmodule Poker.Card do

  defstruct value: "A", suit: :diamonds

  def name(card), do: "#{value_name(card)} of #{suit_name(card)}"
  def short_name(card), do: "#{card.value}#{short_suit card}"

  defp short_suit(card) do
    card.suit
    |> Atom.to_string
    |> String.first
    |> String.capitalize
  end

  defp value_name(%Poker.Card{ value: "A", suit: _ }), do: "Ace"
  defp value_name(%Poker.Card{ value: "K", suit: _ }), do: "King"
  defp value_name(%Poker.Card{ value: "Q", suit: _ }), do: "Queen"
  defp value_name(%Poker.Card{ value: "J", suit: _ }), do: "Jack"
  defp value_name(%Poker.Card{ value: 10, suit: _ }), do: "Ten"
  defp value_name(%Poker.Card{ value: 9, suit: _ }), do: "Nine"
  defp value_name(%Poker.Card{ value: 8, suit: _ }), do: "Eight"
  defp value_name(%Poker.Card{ value: 7, suit: _ }), do: "Seven"
  defp value_name(%Poker.Card{ value: 6, suit: _ }), do: "Six"
  defp value_name(%Poker.Card{ value: 5, suit: _ }), do: "Five"
  defp value_name(%Poker.Card{ value: 4, suit: _ }), do: "Four"
  defp value_name(%Poker.Card{ value: 3, suit: _ }), do: "Three"
  defp value_name(%Poker.Card{ value: 2, suit: _ }), do: "Two"

  defp suit_name(card), do: card.suit |> Atom.to_string |> String.capitalize

end
