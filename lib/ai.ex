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

  # Straight flush: Keep all the cards
  defp _discard([ { 14, s }, { 5, s }, { 4, s }, { 3, s }, { 2, s } ]), do: 
    [ [],  [ { 14, s }, { 5, s }, { 4, s }, { 3, s }, { 2, s } ] ]
  defp _discard([ { v1, s }, { v2, s }, { v3, s }, { v4, s }, { v5, s } ])
  when v2 == v1 - 1
  and v3 == v2 - 1
  and v4 == v3 - 1
  and v5 == v4 - 1, do: [ [],  [ { v1, s }, { v2, s }, { v3, s }, { v4, s }, { v5, s } ] ]

  # Four of a kind: Keep all of the cards
  defp _discard([ {v, s1}, {v, s2}, {v, s3}, {v, s4}, {kv, ks} ]), do: 
    [ [] , [ {v, s1}, {v, s2}, {v, s3}, {v, s4}, {kv, ks} ] ]
  defp _discard([ {kv, ks}, {v, s1}, {v, s2}, {v, s3}, {v, s4} ]), do:
    [ [] , [ {kv, ks}, {v, s1}, {v, s2}, {v, s3}, {v, s4} ] ]

  # Full House: Keep all of the cards
  defp _discard([ {v1, s1}, {v1, s2}, {v1, s3}, {v2, s4}, {v2, s5} ]), do: 
    [ [] , [ {v1, s1}, {v1, s2}, {v1, s3}, {v2, s4}, {v2, s5} ] ]
  defp _discard([ {v1, s1}, {v1, s2}, {v2, s3}, {v2, s4}, {v2, s5} ]), do:
    [ [], [ {v1, s1}, {v1, s2}, {v2, s3}, {v2, s4}, {v2, s5} ] ]

  # Flush: Keep all of the cards
  defp _discard([ {v1, s}, {v2, s}, {v3, s}, {v4, s}, {v5, s} ]), do:
    [ [], [ {v1, s}, {v2, s}, {v3, s}, {v4, s}, {v5, s} ] ]

  # Straight: Keep all of the cards
  defp _discard([ { 14, s1 }, { 5, s2 }, { 4, s3 }, { 3, s4 }, { 2, s5 } ]), do: 
    [ [], [ { 14, s1 }, { 5, s2 }, { 4, s3 }, { 3, s4 }, { 2, s5 } ] ]
  defp _discard([ { v1, s1 }, { v2, s2 }, { v3, s3 }, { v4, s4 }, { v5, s5 } ])
  when v2 == v1 - 1
  and v3 == v2 - 1
  and v4 == v3 - 1
  and v5 == v4 - 1, do: [ [], [ { v1, s1 }, { v2, s2 }, { v3, s3 }, { v4, s4 }, { v5, s5 } ] ]

  # Three of a kind: Keep the 3, discard the others
  defp _discard([ {v1, s1}, {v1, s2}, {v1, s3}, {v2, s4}, {v3, s5} ]), do:
    [ [ {v2, s4}, {v3, s5} ], [ {v1, s1}, {v1, s2}, {v1, s3} ] ]
  defp _value([ {v1, s1}, {v2, s2}, {v2, s3}, {v2, s4}, {v3, s5} ]), do:
    [ [], [ {v1, s1}, {v2, s2}, {v2, s3}, {v2, s4}, {v3, s5} ] ] ## Up to here
  defp _value([ {v1, s1}, {v2, s2}, {v3, s3}, {v3, s4}, {v3, s5} ]), do:
    [ [], [ {v1, s1}, {v2, s2}, {v3, s3}, {v3, s4}, {v3, s5} ] ]

  # Two pair: Discard the kicker
  defp _value([ {v1, _}, {v1, _}, {v2, _}, {v2, _}, {_v3, _} ]), do: 2
  defp _value([ {v1, _}, {v1, _}, {_v2, _}, {v3, _}, {v3, _} ]), do: 2
  defp _value([ {_v1, _}, {v2, _}, {v2, _}, {v3, _}, {v3, _} ]), do: 2

  # One pair: Discard the three
  defp _value([ {v1, _}, {v1, _}, {_v2, _}, {_v3, _}, {_v4, _} ]), do: 1
  defp _value([ {_v1, _}, {v2, _}, {v2, _}, {_v3, _}, {_v4, _} ]), do: 1
  defp _value([ {_v1, _}, {_v2, _}, {v3, _}, {v3, _}, {_v4, _} ]), do: 1
  defp _value([ {_v1, _}, {_v2, _}, {_v3, _}, {v4, _}, {v4, _} ]), do: 1

  # If the hand is rubbish, discard the whole thing
  defp _discard(rubbish), do: [ rubbish, [] ]

  defp _cardify([ discard, keep ]), do: [ _to_cards(discard, []) | [_to_cards(keep,  [])] ]

  defp _to_cards([], accumulator), do: Enum.reverse accumulator
  defp _to_cards([ {v,s} | tail ], accumulator), do: _to_cards(tail, [%Poker.Card{ value: Poker.Card.value_from_number(v), suit: s } | accumulator])

end
