defmodule Mix.Tasks.Hip.Serve do
  use Mix.Task

  def run(_) do
    Mix.Tasks.Hip.Compile.run []

    Plug.Adapters.Cowboy.http Hippocrene.FileServer, []
    unless iex_running? do
      :timer.sleep :infinity
    end
  end

  defp iex_running? do
    Code.ensure_loaded?(IEx) && IEx.started?
  end
end

defmodule Hippocrene.FileServer do
  use Plug.Builder
  import Plug.Conn

  plug Plug.Static, at: "/", from: "./site"
  plug :not_found

  def not_found(conn, _) do
    send_resp conn, 404, "Not Found"
  end
end
