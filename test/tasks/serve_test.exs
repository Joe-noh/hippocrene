defmodule Tasks.Hip.ServeTest do
  use ExUnit.Case
  use Plug.Test

  alias Hippocrene.FileServer

  setup_all do
    Mix.Tasks.Hip.Init.run []
    :timer.sleep 1000
    pid = spawn_link fn -> Mix.Tasks.Hip.Serve.run [] end
    :timer.sleep 1000

    on_exit fn ->
      Process.exit(pid, :normal)
      TestHelper.clean
    end
  end

  test "serve html" do
    conn = conn(:get, "/2014-08-09.html")
    conn = FileServer.call(conn, FileServer.init [])

    assert conn.state  == :sent
    assert conn.status == 200
    assert conn.resp_body =~ ~r/Hello/
  end

  test "detect file modification and compile" do
    source = "./src/articles/example.exs"
    html   = "./site/2014-08-09.html"

    mtime_before = File.stat!(html).mtime
    File.write!(source, File.read! source)
    :timer.sleep 1200
    mtime_after  = File.stat!(html).mtime

    assert mtime_after > mtime_before
  end
end
