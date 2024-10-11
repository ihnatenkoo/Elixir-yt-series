# handler = fn(x) -> x * 2 end
handler = &(&1 * 2)

# handler = fn(x) -> IO.inspect(x) end
# handler = &(IO.inspect(&1))
handler =  &IO.inspect/1
