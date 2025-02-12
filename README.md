# ToDoApp

### Elixir Todo App (No Database):
This is a simple Todo app built with Elixir. The todos are stored in a linked list  without using a database.

### Requirements:
Elixir/Erlang installed.

### How to Run the App:
Clone the repository and navigate to the /todo_app/ directory.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `to_do_app` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:to_do_app, "~> 0.1.0"}
  ]
end
```

Start an interactive Elixir shell by running:
```elixir
iex -S mix
```

Once the shell is launched, type the following command to start the app:
```elixir
TodoApp.start
```
The app will allow you to add, list, remove and update status of  todos, all stored in memory.

```elixir
Happy Coding!
Author: BinaryCrux
```
