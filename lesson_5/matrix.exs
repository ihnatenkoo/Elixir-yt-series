defmodule Matrix do
  def typewrite(filename) do
    File.open(filename, [:read]) |> handle_open()
    # {:ok, io_device}
    # {:error, reason}
  end

  defp handle_open({:ok, io_device}) do
    io_device |>
    read_by_line() |> # must return io_device
    File.close()
  end

  defp handle_open({:error, reason}), do: reason |> IO.inspect()

  defp read_by_line(io_device) do
    IO.read(io_device, :line) |>
    print_line(io_device)
  end

  defp print_line(:eof, io_device), do: io_device
  defp print_line(string, io_device) do
    :timer.sleep(500)

    string |>
    String.split("") |>
    Enum.each(&print_char/1)

    io_device |> read_by_line()
  end

  defp print_char(char) do
    IO.write(char)
    :timer.sleep(100)
  end
end

"matrix.txt" |> Matrix.typewrite()
