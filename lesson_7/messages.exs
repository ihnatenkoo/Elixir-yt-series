defmodule Demo do
  def do_this do
    IO.puts "Working..."

    receive do
      { sender, msg } ->
       IO.inspect sender
       IO.puts "I've received a message: #{msg}"
       send sender, { self(), "Hello to you too!"}

      after 1000 -> IO.puts "I haven't received"
    end

  end
end

pid = spawn Demo, :do_this, []
send pid, {self(), "Hello!"}

receive do
  { sender, msg } ->
    IO.inspect sender
    IO.puts "I've received a message: #{msg}"

    after 1000 -> IO.puts "I haven't received"
end
