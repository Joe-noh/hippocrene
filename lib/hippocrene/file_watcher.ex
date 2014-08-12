defmodule Hippocrene.FileWatcher do
  def start do
    {:ok, sup} = Task.Supervisor.start_link

    # watch modification
    Path.wildcard("./src/articles/**/*.exs")
    |> Enum.each fn (path) ->
      spawn(__MODULE__, :start_to_watch_modification, [sup, path])
    end
  end

  def start_to_watch_modification(sup, path) do
    initial_mtime = to_seconds(File.stat!(path).mtime)
    Task.Supervisor.start_child(sup, __MODULE__, :watch_modification, [sup, path, initial_mtime])
  end

  def watch_modification(sup, path, last_mtime) do
    :timer.sleep 500

    case File.stat(path) do
      {:ok, stat} ->
        new_mtime  = to_seconds(stat.mtime)

        if last_mtime < new_mtime do
          Mix.Tasks.Hip.Compile.compile_file(path)
          Mix.Shell.IO.info "Yeah! Compiling #{path}!"
        end
        watch_modification(sup, path, new_mtime)
      _ ->
        watch_modification(sup, path, last_mtime)
    end
  end

  defp to_seconds(time) do
    :calendar.datetime_to_gregorian_seconds(time)
  end
end
