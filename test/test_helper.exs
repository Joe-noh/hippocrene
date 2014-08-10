ExUnit.start()

defmodule TestHelper do
  def clean do
    File.rm_rf("./src")
  end
end
