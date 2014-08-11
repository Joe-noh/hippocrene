defmodule Tasks.Hip.InitTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  setup do
    on_exit fn ->TestHelper.clean end
    :ok
  end

  test "make directories" do
    Mix.Tasks.Hip.Init.run []

    assert File.dir?("./src")
    assert File.dir?("./src/articles")
    assert File.dir?("./src/assets")
    assert File.dir?("./src/assets/js")
    assert File.dir?("./src/assets/css")
    assert File.dir?("./src/assets/img")

    assert File.regular?("./src/config.exs")
    assert File.regular?("./src/articles/example.exs")
    assert File.regular?("./src/assets/css/normalize.css")
    assert File.regular?("./src/assets/js/jquery.min.js")
  end

  test "abort if thre is a src directory" do
    File.mkdir "./src"
    message = capture_io :stderr, fn -> Mix.Tasks.Hip.Init.run [] end

    assert message =~ "already exist"
  end
end
