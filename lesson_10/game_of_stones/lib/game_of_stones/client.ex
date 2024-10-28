defmodule GameOfStones.Client do
  @server GameOfStones.Server

  def play(initial_stones_num) do
    GenServer.start_link(@server, {:started, initial_stones_num}, name: @server)

   {player, current_stones} = GenServer.call(@server, :current_state)

    IO.puts "Its player #{player} turn! #{current_stones} in the pile."

    next_turn()
  end

  defp next_turn do
   case GenServer.call(@server, {:take, ask_stones()}) do
      {:next_turn, next_player, stones_count} ->
      IO.puts("Player #{next_player} turns next. Stones: #{stones_count}")
      next_turn()

      {:winner, winner} ->
       IO.puts("Player #{winner} wins!")

      {:error, reason} ->
        IO.puts(reason)
        next_turn()
   end
  end

  defp ask_stones do
    IO.gets("How many stones do you want to take? ") |>
    String.trim() |>
    Integer.parse() |>
    stones_to_take()
  end

  defp stones_to_take({count, _}), do: count
  defp stones_to_take(:error), do: 0
end
