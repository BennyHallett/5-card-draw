defmodule Poker.Deck do

  def new do
    values = Enum.map(2..10, &(&1)) ++ ["J", "Q", "K", "A"] |> Enum.reverse
    suits = [:clubs, :spades, :diamonds, :hearts]

    Enum.flat_map(values, fn v -> Enum.map(suits, &(%Poker.Card{ value: v, suit: &1 })) end)
    |> shuffle
  end

  def shuffle(deck) do
    deck |> Enum.shuffle
  end

end
