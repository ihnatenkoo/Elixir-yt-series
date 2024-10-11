# head (hd) --> 1st element of the list
# tail (tl) --> all the rest
# [ head | tail ] = [1, 2, 3, 4]
# tail-call optimization

defmodule Demo do
  # def recur(n) do
  #   recur(n) * 2 # => no optimization!
  # end


  def iterate([]), do: IO.puts("End of the list")
  def iterate([ head | tail ]) do
    head |> IO.inspect()
    tail |> iterate() # => optimization!
  end
end

Demo.iterate([1,2,3])
