defmodule ArticleTest do
  use ExUnit.Case

  require Hippocrene.Article
  alias Hippocrene.Article
  alias Hippocrene.Article.Block

  @empty %Article{}

  test "default parameters" do
    article = @empty

    assert article.title == ""
    assert article.date  == {1970, 1, 1}
    assert article.body  == ""
  end

  test "title function" do
    expected = %Article{title: "The Title"}

    assert Article.title(        "The Title") == expected
    assert Article.title(@empty, "The Title") == expected
  end

  test "date function" do
    expected = %Article{date: {2014, 8, 9}}

    assert Article.date(        {2014, 8, 9}) == expected
    assert Article.date(@empty, {2014, 8, 9}) == expected

    assert Article.date(        2014, 8, 9) == expected
    assert Article.date(@empty, 2014, 8, 9) == expected
  end

  test "integration" do
    article =
      Article.title("The Title")
      |> Article.date(2014, 8, 9)
      |> Article.body do
        Article.section "Section 1" do
          Article.code "elixir" do
            """
            iex> 1+1
            2
            """
          end
          |>
          Article.par do
            """
            Lorem ipsum
            """
          end
          |>
          Article.list :bullet do
            Article.item(do: "one")
            |>
            Article.item(do: "two")
          end
        end
        |>
        Article.section "Section 2" do
          "..."
        end
      end
    expected = %Article{
      body: [
        {:section, "Section 1", [
          {:code, "elixir", "iex> 1+1\n2\n"},
          {:par, "Lorem ipsum\n"},
          {:ul, [{:li, "one"}, {:li, "two"}]}]},
        {:section, "Section 2", "..."}],
      date: {2014, 8, 9},
      title: "The Title"
    }

    assert article == expected
  end
end
