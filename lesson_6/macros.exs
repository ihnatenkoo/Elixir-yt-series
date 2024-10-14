defmodule Demo do
  def run(n) do
    # if n > 20 do
    #   IO.puts "Big number!"
    # else
    #   IO.puts "Small number!"
    # end

    # if n > 20, do: "", else: ""
    # unless n > 20, do: "", else: ""

  #  result = cond do
  #     n > 100 -> "large"
  #     n <= 100 and n >= 50 -> IO.puts "avg"
  #     true -> "small" # fallback
  #   end

  #  result = case n > 100 do
  #     true -> "large"
  #     false -> "small"
  #   end

  case File.open("demo.txt") do
    { :ok, io_dev } -> IO.read(io_dev, :line)
    { :error, reason } -> IO.puts(reason)
    _ -> IO.puts("unexpected error")
  end

  result |> IO.inspect()
  end
end

Demo.run(142)

# falsy values => false and nil
