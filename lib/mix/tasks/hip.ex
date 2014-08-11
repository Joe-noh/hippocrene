defmodule Mix.Tasks.Hip do
  @shortdoc "Run hippocrene tasks"

  @moduledoc """
  This runs following hippocrene tasks

  * mix hip init     # Arrange for directory structurea WIP
  * mix hip compile  # Compile files to HTML WIP
  * mix hip serve    # Build local server and watch files WIP
  * mix hip deploy   # Deploy to somewhere WIP

  Shortened name can be allowed. i.e,

      mix hip s  #=> mix hip serve
  """

  # oh crazy. the power of editor
  # TODO: utilize macro
  def run(["i"    | _]), do: Mix.Tasks.Hip.Init.run []
  def run(["in"   | _]), do: Mix.Tasks.Hip.Init.run []
  def run(["ini"  | _]), do: Mix.Tasks.Hip.Init.run []
  def run(["init" | _]), do: Mix.Tasks.Hip.Init.run []

  def run(["c"       | _]), do: Mix.Tasks.Hip.Compile.run []
  def run(["co"      | _]), do: Mix.Tasks.Hip.Compile.run []
  def run(["com"     | _]), do: Mix.Tasks.Hip.Compile.run []
  def run(["comp"    | _]), do: Mix.Tasks.Hip.Compile.run []
  def run(["compi"   | _]), do: Mix.Tasks.Hip.Compile.run []
  def run(["compil"  | _]), do: Mix.Tasks.Hip.Compile.run []
  def run(["compile" | _]), do: Mix.Tasks.Hip.Compile.run []

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
