defmodule Demo do
  def run do
    IO.puts "Working..."
    exit(:error) # :normal
  end
end

# Process.flag(:trap_exit, true)

# spawn_link Demo, :run, []

# receive do
#   msg -> IO.puts "The linked process says: #{inspect(msg)}"
# end

spawn_monitor Demo, :run, []

receive do
  msg -> IO.puts "The monitored process says: #{inspect(msg)}"
  after 5000 -> IO.puts "The monitored process says nothing"
end
