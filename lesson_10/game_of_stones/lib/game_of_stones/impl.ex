defmodule GameOfStones.Impl do
  def do_take({player, taken_stones, current_stones})
    when not is_integer(taken_stones) or
    taken_stones < 1 or
    taken_stones > 3 or
    taken_stones > current_stones do
      {:reply, {:error, "You can take from 1 to 3 stones"}, {player, current_stones, :game_in_progress}}
    end

def do_take({player, taken_stones, current_stones})
    when taken_stones == current_stones do
      {
        :stop,
        :normal,
        {:winner, next_player(player)},
        {nil, 0, :game_over}
      }
    end

  def do_take({player, taken_stones, current_stones}) do
    new_stones = current_stones - taken_stones
    new_player = next_player(player)

    {:reply,
      {:next_turn, new_player, new_stones}, # response to the client
      {new_player, new_stones, :game_in_progress} # new state of the server
    }
  end

  defp next_player(1), do: 2
  defp next_player(2), do: 1
end
