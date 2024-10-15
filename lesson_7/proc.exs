defmodule Demo do
  def do_this(caller) do
    :timer.sleep 2000

    result = 1
    send caller, {:ok, result}
  end

  def do_this_2(caller) do
    :timer.sleep 1000

    result = 2
    send caller, {:ok, result}
  end

  def do_this_3(caller) do
    :timer.sleep 1000

    result = 3
    send caller, {:ok, result}
  end
end

# result = [Demo.do_this(), Demo.do_this_2(), Demo.do_this_3()]

# result = [
#   spawn(Demo, :do_this, []),
#   spawn(Demo, :do_this_2, []),
#   spawn(Demo, :do_this_3, [])
# ]

caller = self()
do_async = & ( spawn(Demo, &1, [caller]) )

# [
#   do_async.(:do_this),
#   do_async.(:do_this_2),
#   do_async.(:do_this_3),
# ]

Enum.each [ :do_this, :do_this_2, :do_this_3 ], do_async

fetch_results = fn(_) ->
  receive do
    {:ok, number} -> number

   after 5000 -> nil
  end
end


results = Enum.map 1..3, fetch_results

IO.puts "Computation results:  "
results |> IO.inspect
