defmodule Mix.Tasks.Hip do
  @shortdoc "Run hippocrene tasks"
  @moduledoc """
  This runs following hippocrene tasks

  * mix hip init    # Arrange for directory structurea WIP
  * mix hip make    # Compile files to HTML WIP
  * mix hip serve   # Build local server and watch files WIP
  * mix hip deploy  # Deploy to somewhere WIP
  """

  @commands ~w"init make serve deploy"

  def run([]), do: Mix.Tasks.Help.run ["hip"]
  def run([cmd | args]) do
    case Enum.find @commands, &(&1 =~ ~r"^#{cmd}") do
      nil -> run []
      cmd ->
        {:module, mod} = Mix.Utils.command_to_module(cmd, Mix.Tasks.Hip)
        Module.function(mod, :run, 1).(args)
    end
  end
end
