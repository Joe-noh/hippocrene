defmodule Tasks.Hip.CompileTest do
  use ExUnit.Case, async: false

  setup do
    on_exit fn -> TestHelper.clean end
  end

  test "generate site directory" do
    Mix.Tasks.Hip.Init.run []
    Mix.Tasks.Hip.Compile.run []

    assert File.dir?("./site")
  end

  test "compile example.exs" do
    Mix.Tasks.Hip.Init.run []
    Mix.Tasks.Hip.Compile.run []

    :timer.sleep 1000
    assert File.exists?("./site/2014-08-09.html")
  end
end
