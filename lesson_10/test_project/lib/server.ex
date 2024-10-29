defmodule TestProject.Server do
  use GenServer

  def init(initial_state) do
    IO.puts("Server started! #{initial_state}")
   {:ok, initial_state}
  end

  def handle_call(:get_state, _, state) do
    {:reply, state, state}
  end

  def handle_call({:plus, amount}, _, state) do
    {:reply, {:ok, "Plus #{amount}"}, state + amount}
  end

  def handle_call({:minus, amount}, _, state) do
    {:reply, {:ok, "Minus #{amount}"}, state - amount}
  end

  def handle_cast(:reset, _) do
    {:noreply, 0}
  end
end
