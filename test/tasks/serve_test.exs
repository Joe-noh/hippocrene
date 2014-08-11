defmodule Tasks.Hip.ServeTest do
  use ExUnit.Case
  use Plug.Test

  alias Hippocrene.FileServer

  setup do
    on_exit fn -> TestHelper.clean end
  end

  test "serve html" do
    Mix.Tasks.Hip.Init.run []
    Mix.Tasks.Hip.Compile.run []
    :timer.sleep 1000

    conn = conn(:get, "/2014-08-09.html")
    conn = FileServer.call(conn, FileServer.init [])

    assert conn.state  == :sent
    assert conn.status == 200
  end
end
