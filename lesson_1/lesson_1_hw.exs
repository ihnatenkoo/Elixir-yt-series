friends = %{"Alex" => 1994, "Andrey" => 1990, "Dmitry" => 1991}

name = IO.gets("Enter name: ") |> String.trim()
friends |> Map.get(name) |> IO.inspect()
