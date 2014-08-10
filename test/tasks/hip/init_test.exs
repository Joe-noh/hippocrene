defmodule Tasks.Hip.InitTest do
  use ExUnit.Case

  setup_all do
    on_exit fn ->
      TestHelper.clean
    end
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
end
