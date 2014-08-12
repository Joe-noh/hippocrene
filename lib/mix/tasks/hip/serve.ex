defmodule Mix.Tasks.Hip.Serve do
  use Mix.Task

  def run(_) do
    Mix.Tasks.Hip.Compile.run []

    Plug.Adapters.Cowboy.http Hippocrene.FileServer, []
    Mix.Shell.IO.info "Go! Go! http://localhost:4000!"

    Hippocrene.FileWatcher.start
    unless iex_running?, do: :timer.sleep :infinity
  end

  defp iex_running? do
    Code.ensure_loaded?(IEx) && IEx.started?
  end
end

