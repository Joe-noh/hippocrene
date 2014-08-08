defmodule Mix.Tasks.Hip do
  @shortdoc "Run hippocrene tasks"

  @moduledoc """
  This runs following hippocrene tasks

  * mix hip init    # Arrange for directory structurea WIP
  * mix hip make    # Compile files to HTML WIP
  * mix hip serve   # Build local server and watch files WIP
  * mix hip deploy  # Deploy to somewhere WIP

  Shortened name can be allowed. i.e,

      mix hip s  #=> mix hip serve
  """

  # oh crasy. the power of editor
  def run(["i"    | _]), do: Mix.Tasks.Hip.Init.run []
  def run(["in"   | _]), do: Mix.Tasks.Hip.Init.run []
  def run(["ini"  | _]), do: Mix.Tasks.Hip.Init.run []
  def run(["init" | _]), do: Mix.Tasks.Hip.Init.run []

  def run(["m"    | _]), do: Mix.Tasks.Hip.Make.run []
  def run(["ma"   | _]), do: Mix.Tasks.Hip.Make.run []
  def run(["mak"  | _]), do: Mix.Tasks.Hip.Make.run []
  def run(["make" | _]), do: Mix.Tasks.Hip.Make.run []

  def run(["s"     | _]), do: Mix.Tasks.Hip.Serve.run []
  def run(["se"    | _]), do: Mix.Tasks.Hip.Serve.run []
  def run(["ser"   | _]), do: Mix.Tasks.Hip.Serve.run []
  def run(["serv"  | _]), do: Mix.Tasks.Hip.Serve.run []
  def run(["serve" | _]), do: Mix.Tasks.Hip.Serve.run []

  def run(["d"      | _]), do: Mix.Tasks.Hip.Deploy.run []
  def run(["de"     | _]), do: Mix.Tasks.Hip.Deploy.run []
  def run(["dep"    | _]), do: Mix.Tasks.Hip.Deploy.run []
  def run(["depl"   | _]), do: Mix.Tasks.Hip.Deploy.run []
  def run(["deplo"  | _]), do: Mix.Tasks.Hip.Deploy.run []
  def run(["deploy" | _]), do: Mix.Tasks.Hip.Deploy.run []

  def run([ ]), do: Mix.Tasks.Help.run ["hip"]
  def run([_]), do: Mix.Tasks.Help.run ["hip"]
end
