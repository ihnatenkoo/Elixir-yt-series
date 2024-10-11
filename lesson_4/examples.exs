defmodule Demo do
    # len/2 without optimization
  # def len([]), do: 0
  # def len([_h | t]), do: len(t) + 1

  # len/2 with optimization
  def len(list), do: do_len(0, list)

  defp do_len(total_length,[_h | t]) do
    do_len(total_length + 1, t)
  end

  defp do_len(total_length, []), do: total_length

  # span/2
  def span(from, to), do: do_span([], from, to)

  defp do_span(list, from, to) when from > to, do: list

  defp do_span(list, from, to) do
    do_span([to | list], from, to - 1)
  end

  # max/1
  def max([ value | [head | tail ] ]) when value > head do
    max([ value | tail])
  end

  def max([ value | [head | tail ] ]) when value <= head do
    max([ head | tail])
  end

  def max([ value ]), do: value

  # keep_odd/1
  def keep_odd(list) do
    Enum.filter(list, fn x -> rem(x, 2) != 0 end)

    # def keep_odd(list), do: do_keep_odd([], list)

    # defp do_keep_odd(result, [h | t]) when rem(h, 2) != 0 do
    #   do_keep_odd([h | result], t)
    # end

    # defp do_keep_odd(result, [h | t]) when rem(h, 2) == 0 do
    #   do_keep_odd(result, t)
    # end

    # defp do_keep_odd(result, []), do: result
  end
end

# [1,2,3] |> Demo.len() |> IO.inspect()
# 2 |> Demo.span(10) |> IO.inspect()
# [1,2,10,4] |> Demo.max() |> IO.inspect()
[1,2,10,7,4,101] |> Demo.keep_odd() |> IO.inspect()
