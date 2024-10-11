["dog", "cat", "elephant", "giraffe"] |> Enum.map(&String.length/1)
["dog", "cat", "elephant", "giraffe"] |> Enum.filter(&(String.length(&1) > 3))

# closure
num = 3
handler = &(&1 * num)
IO.inspect(handler.(2))
