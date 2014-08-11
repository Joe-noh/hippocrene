defmodule Hippocrene.HtmlRenderer do
  alias Hippocrene.Article

  ~S"""
  def render(%Article{title: title, date: date, body: body}) do
    "<h2>#{title}</h2>\n<div>#{render body, 3}</div>"
  end

  defp render([head | rest], h_num) do
    "#{render head, h_num}#{render rest, h_num}"
  end

  defp render({:section, section_title, content}, h_num) do
    n = h_num
    "<h#{n}>#{section_title}</h#{n}>\n<div>\n#{render content, n+1}\n</div>"
  end

  defp render({:par, content}, h_num) do
    "<p>#{render content, h_num}</p>"
  end

  defp render({:code, language, content}, h_num) do
    "<pre class='#{language}'><code>\n#{render content, h_num}\n</code></pre>"
  end

  defp render({:cite, content}, h_num) do
    "<blockquote>\n#{render content, h_num}\n</blockquote>"
  end

  defp render({:ul, content}, h_num) do
    "<ul>\n#{render content, h_num}\n</ul>"
  end

  defp render({:ol, content}, h_num) do
    "<ol>\n#{render content, h_num}\n</ol>"
  end

  defp render({:li, content}, h_num) do
    "<li>#{render content, h_num}</li>"
  end

  defp render({:table, content}, h_num) do
    "<table>\n#{render content, h_num}\n</table>"
  end

  defp render({:th, list}, h_num) do
    ths = Enum.map(list, fn (item) -> "<th>#{item}</th>" end) |> Enum.join("\n")
    "<tr>\n#{ths}\n</tr>"
  end

  defp render({:td, list}, h_num) do
    tds = Enum.map(list, fn (item) -> "<td>#{item}</td>" end) |> Enum.join("\n")
    "<tr>\n#{tds}\n</tr>"
  end

  defp render(content, _) when is_binary(content), do: content
  defp render([], _), do: ""

  """
end
