defmodule Poker.Comparison do

  def determine_winner([ { name, _hand } | [] ]), do: name
  def determine_winner([ hand1, hand2 | tail ]), do: determine_winner(winner_of(hand1, hand2) ++ tail)

  defp winner_of({ n1, h1 }, { n2, h2 }), do: _winner_of({ n1, h1, Poker.Hand.value(h1) }, { n2, h2, Poker.Hand.value(h2) })

  defp _winner_of({ n1, h1, v1 }, { n2, h2, v2 }) when v1 > v2, do: [{ n1, h1 }]
  defp _winner_of({ n1, h1, v1 }, { n2, h2, v2 }) when v1 < v2, do: [{ n2, h2 }]

end
