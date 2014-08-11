defmodule HtmlRendererTest do
  use ExUnit.Case

  alias Hippocrene.HtmlRenderer

  test "par" do
    rendered = render_partial {:par, ["one", "two"]}
    expected = "<p>one\ntwo</p>\n"

    assert rendered == expected
  end

  test "cite" do
    rendered = render_partial {:cite, ["one", "two"]}
    expected = "<blockquote>one\ntwo</blockquote>\n"

    assert rendered == expected
  end

  test "item" do
    rendered = render_partial {:item, ["one", "two"]}
    expected = "<li>one\ntwo</li>\n"

    assert rendered == expected
  end

  test "table" do
    rendered = render_partial {:table, ["one", "two"]}
    expected = "<table>one\ntwo</table>\n"

    assert rendered == expected
  end

  test "section" do
    rendered = render_partial {:section, "Section 1", ["one", "two"]}
    expected = "<h3>Section 1</h3><div>one\ntwo</div>\n"

    assert rendered == expected
  end

  test "code" do
    rendered = render_partial {:code, "elixir", ["one", "two"]}
    expected = "<pre class='elixir'><code>one\ntwo</code></pre>\n"

    assert rendered == expected
  end

  test "list" do
    rendered = render_partial {:bullet, ["one", "two"]}
    expected = "<ul>one\ntwo</ul>\n"

    assert rendered == expected

    rendered = render_partial {:numbered, ["one", "two"]}
    expected = "<ol>one\ntwo</ol>\n"

    assert rendered == expected
  end

  test "header" do
    rendered = render_partial {:header, ["one", "two"]}
    expected = "<tr><th>one</th><th>two</th></tr>\n"

    assert rendered == expected
  end

  test "row" do
    rendered = render_partial {:row, ["one", "two"]}
    expected = "<tr><td>one</td><td>two</td></tr>\n"

    assert rendered == expected
  end

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
  """

  defp render_partial(content) do
    HtmlRenderer.render([title: "", date: "", author: "", body: [content]])
    |> String.replace(~r"\A.+?<div>"sm, "")
    |> String.replace(~r"</div>\z", "")
  end
end
