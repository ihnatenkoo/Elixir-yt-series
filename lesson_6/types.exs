# defmodule Demo do
#   @default_opts [ mode: "r", filename: "demo.txt"]

#   def run(_arg, opts \\ []) do
#     opts = Keyword.merge(@default_opts, opts)
#     opts |> IO.inspect()
#   end
# end

# Demo.run(41, [mode: "w"])

defmodule User do
  defstruct name: "",
            surname: "",
            age: 0,
            role: :member

  def show(user)  do
    user |> IO.inspect()
  end

  def update(user = %User{}, new_name) do
    %User{ user | name: new_name}
  end

  def update_age( user = %User{}, new_age) do
    %User{ user | age: new_age }
  end
end

defmodule Department do
  defstruct title: "",
            employees: [],
            head: %User{}
end

defmodule Demo do
  def run do
    user = %User { name: "John", surname: "Dou", age: 40, role: :admin }
    user |> User.show()

    update_user = user |> User.update("Jim")
    update_user |> User.show()

    head_of_department = %User {
      name: "Alex", surname: "Goer", age: 33, role: :admin
    }

    department = %Department{
      title: "IT",
      employees: [head_of_department, update_user],
      head: head_of_department
    }

    user = %User { name: "Ann", surname: "Smith", age: 20, role: :member }

    department =  %Department{
      department |
      employees: [ user | department.employees]
    }

    department = update_in(department.head.age, &(&1 + 1))

   updated_department_employees = Enum.map(department.employees,
      fn
        %User{name: "Alex"} = user -> User.update_age(user, user.age + 1)
        other_user -> other_user
      end
    )

    department = %Department{
      department |
      employees: updated_department_employees
    }

    department |> IO.inspect()
  end
end

Demo.run()
