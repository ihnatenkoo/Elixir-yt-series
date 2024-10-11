creation_date = fn
  "elixir" -> 2011
  "erlang" -> 1986
  lang when is_bitstring(lang) -> "Not sure about #{lang}"
  _ -> nil
end

creation_date.("elixir") |> IO.inspect()
