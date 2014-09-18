defmodule Poker.Ai do

  def discard([ c1, c2, c3, c4, c5 ]) do
    [ { Poker.Card.value(c1.value), c1.suit },
      { Poker.Card.value(c2.value), c2.suit },
      { Poker.Card.value(c3.value), c3.suit },
      { Poker.Card.value(c4.value), c4.suit },
      { Poker.Card.value(c5.value), c5.suit } ]
    |> Enum.sort(fn ({v1, _}, {v2, _}) -> v1 > v2 end)
    |> _discard
    |> _cardify
  end

  # Straight flush: All cards same suit in sequence
  defp _discard([ { 14, s }, { 5, s }, { 4, s }, { 3, s }, { 2, s } ]), do: 
    [ [],  [ { 14, s }, { 5, s }, { 4, s }, { 3, s }, { 2, s } ] ]
  defp _discard([ { v1, s }, { v2, s }, { v3, s }, { v4, s }, { v5, s } ])
  when v2 == v1 - 1
  and v3 == v2 - 1
  and v4 == v3 - 1
  and v5 == v4 - 1, do: [ [],  [ { v1, s }, { v2, s }, { v3, s }, { v4, s }, { v5, s } ] ]

  # Four of a kind: Four cards same value, some other card (either higher or lower)
  defp _value([ {v, _s1}, {v, _s2}, {v, _s3}, {v, _s4}, _ ]), do: 7
  defp _value([ _, {v, _s1}, {v, _s2}, {v, _s3}, {v, _s4} ]), do: 7

  # Full House: 3 cards of one value, 2 of another value (high/low and low/high)
  defp _value([ {v1, _}, {v1, _}, {v1, _}, {v2, _}, {v2, _} ]), do: 6
  defp _value([ {v1, _}, {v1, _}, {v2, _}, {v2, _}, {v2, _} ]), do: 6

  # Flush: 5 cards, not in sequence (handled by case above), all with same suit
  defp _value([ {_, s}, {_, s}, {_, s}, {_, s}, {_, s} ]), do: 5

  # Straight: All cards in sequence
  defp _value([ { 14, _ }, { 5, _ }, { 4, _ }, { 3, _ }, { 2, _ } ]), do: 4
  defp _value([ { v1, _ }, { v2, _ }, { v3, _ }, { v4, _ }, { v5, _ } ])
  when v2 == v1 - 1
  and v3 == v2 - 1
  and v4 == v3 - 1
  and v5 == v4 - 1 do
    4
  end

  # Three of a kind: 3 cards of the same value, plus 2 extras each with a different value
  defp _value([ {v1, _}, {v1, _}, {v1, _}, {_v2, _}, {_v3, _} ]), do: 3
  defp _value([ {_v1, _}, {v2, _}, {v2, _}, {v2, _}, {_v3, _} ]), do: 3
  defp _value([ {_v1, _}, {_v2, _}, {v3, _}, {v3, _}, {v3, _} ]), do: 3

  # Two pair
  defp _value([ {v1, _}, {v1, _}, {v2, _}, {v2, _}, {_v3, _} ]), do: 2
  defp _value([ {v1, _}, {v1, _}, {_v2, _}, {v3, _}, {v3, _} ]), do: 2
  defp _value([ {_v1, _}, {v2, _}, {v2, _}, {v3, _}, {v3, _} ]), do: 2

  # One pair
  defp _value([ {v1, _}, {v1, _}, {_v2, _}, {_v3, _}, {_v4, _} ]), do: 1
  defp _value([ {_v1, _}, {v2, _}, {v2, _}, {_v3, _}, {_v4, _} ]), do: 1
  defp _value([ {_v1, _}, {_v2, _}, {v3, _}, {v3, _}, {_v4, _} ]), do: 1
  defp _value([ {_v1, _}, {_v2, _}, {_v3, _}, {v4, _}, {v4, _} ]), do: 1


  defp _value(_), do: 0

  defp _cardify([ discard, keep ]), do: [ _to_cards(discard, []) | [_to_cards(keep,  [])] ]

  defp _to_cards([], accumulator), do: Enum.reverse accumulator
  defp _to_cards([ {v,s} | tail ], accumulator), do: _to_cards(tail, [%Poker.Card{ value: v, suit: s } | accumulator])

end
