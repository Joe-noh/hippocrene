defmodule Mix.Tasks.Hip.Compile do
  use Mix.Task
  alias Hippocrene.HtmlRenderer

  def run(_) do
    if not File.exists?("./site") do
      File.mkdir! "./site"
    end

    Path.wildcard("./src/articles/**/*.exs")
    |> Enum.each fn (path) ->
      spawn(__MODULE__, :compile_file, [path])
    end
  end

  def compile_file(path) do
    {article, _} = Code.eval_file(path)
    {y, m, d} = Dict.get(article, :date)

    m = String.rjust(Integer.to_string(m), 2, ?0)
    d = String.rjust(Integer.to_string(d), 2, ?0)

    File.write "./site/#{y}-#{m}-#{d}.html", HtmlRenderer.render(article)
  end
end
