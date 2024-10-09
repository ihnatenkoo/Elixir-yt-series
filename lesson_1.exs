defmodule DemoModuleLesson1 do
  def run(str) do
    # str = String.reverse(str)
    # str = String.upcase(str)
    # IO.inspect(str)

    str |> String.reverse() |> String.upcase() |> IO.inspect()
  end
end

# DemoModuleLesson1.run("Hello, World!")
"Hello, World!" |> DemoModuleLesson1.run()

# Numbers
a = 5
b = 3.14
c = 1_000_000
d = 0.345e3
hex = 0xfa
rem(10,3) # Остаток от деления
div(10,3) # Целочисленное деление

# Atoms
at = :one
name = :my_name

# Boolean
:true
:false
a = true
b = false

# Nil value
:nil
nil

# Tuples
t1 = {1, "three", :four, false}
_t2 = {2, {3,4}, :dog, t1}
{:ok, "Success"}
{:error, "Failed"}
elem {:ok, "Success"}, 0

my_tuple = {"cat", "dog", 3}
new_tuple = my_tuple |> put_elem(1, "snake")

# Lists
[1,2, {3,4}, "dog", ["cat"], :nil]

# Keyword list
my_list = [title: "Elixir", emerged: 2011]
Keyword.get(my_list, :title)
my_list |> Keyword.get(:title)
[{:title, "Elixir"}, {:emerged, 2011}] # the same as my_list

# Maps
data = %{"title" => "Elixir", :paradigm => "functional", 2011 => "emerged"}
data[:paradigm] # => "functional"
data.paradigm # => "functional"
data[:unknown] # => "nil"
data.unknown # => error

#String

## Binary strings
"test"
"result: #{1+2}"

## Character lists
'my string'
~c"my string"
