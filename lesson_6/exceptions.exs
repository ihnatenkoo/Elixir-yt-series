defmodule Demo do
  def run do
    try do
      # 1 / 0
    { :ok, io_dev } = File.open("demo.txt")
    rescue
      error in ArithmeticError -> IO.inspect(error)
      error in MatchError -> IO.inspect(error)
    end
  end
end

Demo.run()
