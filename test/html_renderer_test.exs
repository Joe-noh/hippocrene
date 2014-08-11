defmodule HtmlRendererTest do
  use ExUnit.Case

  alias Hippocrene.Article
  alias Hippocrene.HtmlRenderer

  ~S"""
  test "section" do
    rendered = render_partial {:section, "Section 1", "content"}
    expected = "<h3>Section 1</h3>\n<div>\ncontent\n</div>"

    assert rendered == expected
  end

  test "paragraph" do
    rendered = render_partial {:par, "content"}
    expected = "<p>content</p>"

    assert rendered == expected
  end

  test "code" do
    rendered = render_partial {:code, "elixir", "content"}
    expected = "<pre class='elixir'><code>\ncontent\n</code></pre>"

    assert rendered == expected
  end

  test "quotation" do
    rendered = render_partial {:cite, "content"}
    expected = "<blockquote>\ncontent\n</blockquote>"

    assert rendered == expected
  end

  test "unordered list" do
    rendered = render_partial {:ul, "content"}
    expected = "<ul>\ncontent\n</ul>"

    assert rendered == expected
  end

  test "ordered list" do
    rendered = render_partial {:ol, "content"}
    expected = "<ol>\ncontent\n</ol>"

    assert rendered == expected
  end

  test "list item" do
    rendered = render_partial {:li, "content"}
    expected = "<li>content</li>"

    assert rendered == expected
  end

  test "table" do
    rendered = render_partial {:table, "content"}
    expected = "<table>\ncontent\n</table>"

    assert rendered == expected
  end

  test "table header" do
    rendered = render_partial {:th, [1, "2", 3]}
    expected = "<tr>\n<th>1</th>\n<th>2</th>\n<th>3</th>\n</tr>"

    assert rendered == expected
  end

  test "table data" do
    rendered = render_partial {:td, [1, "2", 3]}
    expected = "<tr>\n<td>1</td>\n<td>2</td>\n<td>3</td>\n</tr>"

    assert rendered == expected
  end

  defp render_partial(content) do
    HtmlRenderer.render(%Article{title: "", date: "", body: content})
    |> String.replace(~r"\A.+?<div>"sm, "")
    |> String.replace(~r"</div>\z", "")
  end
  """
end
