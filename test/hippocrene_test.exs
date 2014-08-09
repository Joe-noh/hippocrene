defmodule HippocreneTest do
  use ExUnit.Case

  test "eval article.exs" do
    file = "test/sample/article.exs"
    {result, _} = Code.eval_file(file)

    IO.puts result
  end
end
