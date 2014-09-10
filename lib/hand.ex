defmodule Poker.Hand do

  def value([ c1, c2, c3, c4, c5 ]) do
    [ { Poker.Card.value(c1.value), c1.suit },
      { Poker.Card.value(c2.value), c2.suit },
      { Poker.Card.value(c3.value), c3.suit },
      { Poker.Card.value(c4.value), c4.suit },
      { Poker.Card.value(c5.value), c5.suit } ]
    |> Enum.sort(fn ({v1, _}, {v2, _}) -> v1 > v2 end)
    |> _value
  end

  # Straight flush: All cards same suit in sequence
  defp _value([ { v1, s }, { v2, s }, { v3, s }, { v4, s }, { v5, s } ])
  when v2 == v1 - 1
  and v3 == v2 - 1
  and v4 == v3 - 1
  and v5 == v4 - 1 do
    8
  end

  # Four of a kind: Four cards same value, some other card (either higher or lower)
  defp _value([ {v, _s1}, {v, _s2}, {v, _s3}, {v, _s4}, _ ]), do: 7
  defp _value([ _, {v, _s1}, {v, _s2}, {v, _s3}, {v, _s4} ]), do: 7

  defp _value(_), do: 0

end
