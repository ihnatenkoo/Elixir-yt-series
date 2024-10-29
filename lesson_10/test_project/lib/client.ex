defmodule TestProject.Client do
  @server TestProject.Server

  def run(initial_state) do
    GenServer.start_link(@server, initial_state, name: @server)
  end

  def get_state do
    GenServer.call(@server, :get_state)
  end

  def plus(amount) do
    GenServer.call(@server, {:plus, amount})
  end

  def minus(amount) do
    GenServer.call(@server, {:minus, amount})
  end

  def reset do
    GenServer.cast(@server, :reset)
  end
end
