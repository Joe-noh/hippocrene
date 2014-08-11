defmodule Hippocrene.HtmlRenderer do

  def render([title: title, date: _date, author: author, body: body]) do
    "<h2>#{title}</h2>\n<p>#{author}</p><div>#{render body, 3}</div>"
  end

  defp render([{:par, content} | rest], n) do
    "<p>#{render content, n}</p>\n#{render rest, n}"
  end

  defp render([{:cite, content} | rest], n) do
    "<blockquote>#{render content, n}</blockquote>\n#{render rest, n}"
  end

  defp render([{:item, content} | rest], n) do
    "<li>#{render content, n}</li>\n#{render rest, n}"
  end

  defp render([{:table, content} | rest], n) do
    "<table>#{render content, n}</table>\n#{render rest, n}"
  end

  defp render([{:section, section_title, content} | rest], n) do
    "<h#{n}>#{section_title}</h#{n}><div>#{render content, n+1}</div>\n#{render rest, n}"
  end

  defp render([{:code, lang, content} | rest], n) do
    "<pre class='#{lang}'><code>#{render content, n}</code></pre>\n#{render rest, n}"
  end

  defp render([{:bullet, content} | rest], n) do
    "<ul>#{render content, n}</ul>\n#{render rest, n}"
  end

  defp render([{:numbered, content} | rest], n) do
    "<ol>#{render content, n}</ol>\n#{render rest, n}"
  end

  defp render([{:header, content} | rest], n) do
    ths = List.foldl content, "", fn (th, acc) -> acc <> "<th>#{th}</th>" end
    "<tr>#{ths}</tr>\n#{render rest, n}"
  end

  defp render([{:row, content} | rest], n) do
    tds = List.foldl content, "", fn (td, acc) -> acc <> "<td>#{td}</td>" end
    "<tr>#{tds}</tr>\n#{render rest, n}"
  end

  defp render([],   _), do: ""
  defp render(list, _), do: Enum.join(list, "\n")
end
