defmodule Mix.Tasks.Game do
  use Mix.Task

  @shortdoc "."
  @moduledoc """
  """
  def run(args) do
    :random.seed(:os.timestamp)

    build_deck
    |> create_opponents
    |> create_player
    |> shuffle_seats
    |> deal
    |> show_hidden_hands
    |> discard
    |> evaluate
    |> announce_winner
  end

  defp build_deck, do: Poker.Deck.new

  defp create_opponents(deck), do: _create_opponents(%{ deck: deck, players: [] }, 0)
  defp _create_opponents(state, 3), do: state
  defp _create_opponents(%{ deck: deck, players: players }, accumulator ), do: _create_opponents(%{ deck: deck, players: [Poker.Ai.new(accumulator+1) | players] }, accumulator + 1)

  defp create_player(state), do: %{ deck: state.deck, players: [{ "Player", nil } | state.players ] }

  defp shuffle_seats(state), do: %{ deck: state.deck, players: Enum.shuffle(state.players) }

  defp deal(state), do: _deal(state, [])
  defp _deal(%{ deck: deck, players: [] }, output), do: %{ deck: deck, players: output }
  defp _deal(%{ deck: [c1, c2, c3, c4, c5 | tail], players: [{ name, _ } | rest_of_players] }, output), do: _deal(%{ deck: tail, players: rest_of_players }, [ { name, [c1, c2, c3, c4, c5] } | output ])

  defp show_hidden_hands(state) do
    _show_hidden_hands(state.players)
    state
  end
  defp _show_hidden_hands([]), do: IO.puts "--------------------------------------"
  defp _show_hidden_hands([ { "Player", hand } | tail ]) do
    IO.puts "Player"
    Enum.each(hand, &(IO.write "#{Poker.Card.short_name(&1)} "))
    IO.puts ""
    IO.puts ""
    _show_hidden_hands(tail)
  end
  defp _show_hidden_hands([ { name, hand } | tail ]) do
    IO.puts name
    Enum.each(hand, fn _ -> IO.write "## " end)
    IO.puts ""
    IO.puts ""
    _show_hidden_hands(tail)
  end

  defp discard(state), do: _discard(state, [])
  defp _discard(%{ deck: deck, players: [] }, output), do: %{ deck: deck, players: output }
  defp _discard(%{ deck: deck, players: [{ "Player", hand } | tail] }, output) do
    _discard(%{ deck: deck, players: tail }, [{ "Player", hand } | output ])
  end
  defp _discard(%{ deck: deck, players: [{ name, hand } | tail] }, output) do
    [ chuck, keep ] = Poker.Ai.discard hand
    { additions, remaining }= Enum.split(deck, length(chuck))
    _discard(%{ deck: remaining, players: tail }, [{ name, keep ++ additions } | output ])
  end

  def evaluate(state), do: Poker.Comparison.determine_winner(state.players)

  def announce_winner({ name, hand }), do: IO.puts "#{name} was the winner with #{Poker.Hand.print(hand)}"

end
