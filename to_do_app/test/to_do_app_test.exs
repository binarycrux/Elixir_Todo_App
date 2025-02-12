defmodule ToDoAppTest do
  use ExUnit.Case
  doctest ToDoApp

  test "greets the world" do
    assert ToDoApp.hello() == :world
  end
end
