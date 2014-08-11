ExUnit.start()

defmodule TestHelper do
  def clean do
    File.rm_rf("./src")
    File.rm_rf("./site")
  end
end
