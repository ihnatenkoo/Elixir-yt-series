defmodule Birthdays.Server do
  def run do
    spawn(fn -> loop(%{}) end) |> Process.register(:birthdays)
  end

  defp loop(current_state) do
   new_state = receive do
      message -> process_message(current_state, message)
    end

    new_state |> loop()
  end

  defp process_message(current_state, { :add, name, birthday }) do
    current_state |> Map.put(name, birthday)
  end

  defp process_message(current_state, { :all, caller }) do
    caller |> send({ :response, current_state})
    current_state
  end

  defp process_message(current_state, { :get, caller, name }) do
    caller |> send({ :response, current_state[name]})
    current_state
  end

  defp process_message(current_state, { :remove, name }) do
    current_state |> Map.delete(name)
  end
end

defmodule Birthdays.Client do
  defp do_send(msg), do: send(:birthdays, msg)

  defp get_response do
    receive do
      {:response, data} -> data
      _ -> :error
    after 5000 -> IO.puts "Timeout"
    end
  end

  def all do
    do_send({ :all, self() })
    get_response()
  end

  def get(name) do
    do_send({ :get, self(), name })
    get_response()
  end

  def add(name, birthday) do
    do_send({ :add, name, birthday })
  end

  def remove(name) do
    do_send({ :remove, name })
  end
end

Birthdays.Server.run

Birthdays.Client.add("Jane", "29 may")
Birthdays.Client.add("Bob", "12 july")
# Birthdays.Client.add("Bob", "29 october")
# Birthdays.Client.all |> IO.inspect
Birthdays.Client.get("Bob") |> IO.inspect
