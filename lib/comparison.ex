defmodule Poker.Comparison do

  def determine_winner([ { name, hand } | [] ]), do: { name, hand }
  def determine_winner([ hand1, hand2 | tail ]), do: determine_winner(winner_of(hand1, hand2) ++ tail)

  defp winner_of({ n1, h1 }, { n2, h2 }), do: _winner_of({ n1, h1, Poker.Hand.value(h1) }, { n2, h2, Poker.Hand.value(h2) })

  defp _winner_of({ n1, h1, v1 }, { _n2, _h2, v2 }) when v1 > v2, do: [{ n1, h1 }]
  defp _winner_of({ _n1, _h1, v1 }, { n2, h2, v2 }) when v1 < v2, do: [{ n2, h2 }]
  defp _winner_of({ n1, h1, v }, { n2, h2, v }),                  do: _tie_break(v, {n1, h1}, {n2, h2})

  defp _tie_break(0, {n1, h1}, {n2, h2}), do: _high_card({n1, h1, Enum.map(h1, &({ &1, Poker.Card.value(&1.value)}))},
                                                         {n2, h2, Enum.map(h2, &({ &1, Poker.Card.value(&1.value)}))})

  defp _high_card({n1, h1, [{_c1, v1} | _t1]}, {_n2, _h2, [{_c2, v2} | _t2]}) when v1 > v2, do: [{n1, h1}]
  defp _high_card({_n1, _h1, [{_c1, v1} | _t1]}, {n2, h2, [{_c2, v2} | _t2]}) when v1 < v2, do: [{n2, h2}]
  defp _high_card({n1, h1, [{_c1, v} | t1]}, {n2, h2, [{_c2, v} | t2]}), do: _high_card({n1, h1, t1}, {n2, h2, t2})

end
