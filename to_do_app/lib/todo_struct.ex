defmodule ToDoApp.ToDoStruct do
  defmodule Task do
    defstruct description: "", status: "pending"
  end

  def start do
    # Starting with an empty list of tasks
    loop([])
  end

  defp loop(tasks) do
    IO.puts("""
    1. Add a to-do
    2. Delete a to-do
    3. List all to-dos
    4. Edit a to-do status
    5. Exit
    """)

    case IO.gets("Choose an option: ") |> String.trim() do
      "1" ->
        tasks = add_task(tasks)
        loop(tasks)
      "2" ->
        tasks = delete_task(tasks)
        loop(tasks)
      "3" ->
        list_tasks(tasks)
        back_option = length(tasks) + 1
        IO.puts("#{back_option}: Back")
        case IO.gets("Choose an option: ") |> String.trim() |> String.to_integer() do
          option when option == back_option ->
            loop(tasks)
          _ ->
            IO.puts("Invalid option")
            loop(tasks)
        end
      "4" ->
        tasks = edit_task_status(tasks)
        loop(tasks)
      "5" ->
        IO.puts("Goodbye!")
      _ ->
        # In the case of an invalid input
        IO.puts("Invalid option")
        loop(tasks)
    end
  end

  # Function to add a new task to the list
  defp add_task(tasks) do
    description = IO.gets("Enter the task: ") |> String.trim()
    task = %Task{description: description}
    [task | tasks]
  end

  # Function to delete a task from the list
  defp delete_task(tasks) do
    list_tasks(tasks)
    index = IO.gets("Enter the task number to delete: ") |> String.trim() |> String.to_integer()
    tasks = Enum.reverse(tasks)
    tasks = List.delete_at(tasks, index - 1)
    Enum.reverse(tasks)
  end

  # Function to edit the status of a task
  defp edit_task_status(tasks) do
    list_tasks(tasks)
    index = IO.gets("Enter the task number to edit: ") |> String.trim() |> String.to_integer()
    status = IO.gets("Enter the new status (pending/done): ") |> String.trim()
    tasks = Enum.reverse(tasks)
    updated_tasks = List.update_at(tasks, index - 1, fn task -> %Task{task | status: status} end)
    Enum.reverse(updated_tasks)
  end

  # Function to list all tasks
  defp list_tasks(tasks) do
    tasks
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.each(fn {task, index} ->
      IO.puts("#{index + 1}. #{task.description} - Status: #{task.status}")
    end)
  end
end
