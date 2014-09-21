defmodule Mix.Tasks.Game do
  use Mix.Task

  @shortdoc "."
  @moduledoc """
  """
  def run(args) do
    build_deck
    |> create_players
    |> deal
    |> show_hidden_hands
    #|> discard
    #|> evaluate
    #|> announce_winner
  end

  defp build_deck, do: Poker.Deck.new

  defp create_players(deck), do: _create_players(%{ deck: deck, players: [] }, 0)
  defp _create_players(state, 3), do: state
  defp _create_players(%{ deck: deck, players: players }, accumulator ), do: _create_players(%{ deck: deck, players: [Poker.Ai.new(accumulator+1) | players] }, accumulator + 1)

  defp deal(state), do: _deal(state, [])
  defp _deal(%{ deck: deck, players: [] }, output), do: %{ deck: deck, players: output }
  defp _deal(%{ deck: [c1, c2, c3, c4, c5 | tail], players: [{ name, _ } | rest_of_players] }, output), do: _deal(%{ deck: tail, players: rest_of_players }, [ { name, [c1, c2, c3, c4, c5] } | output ])

  defp show_hidden_hands(state) do
    _show_hidden_hands(state.players)
    state
  end
  defp _show_hidden_hands([]), do: IO.puts "--------------------------------------"
  defp _show_hidden_hands([ { name, hand } | tail ]) do
    IO.puts name
    Enum.each(hand, &(IO.write "#{Poker.Card.short_name(&1)} "))
    IO.puts ""
    IO.puts ""
    _show_hidden_hands(tail)
  end

end
