defmodule ArticleTest do
  use ExUnit.Case

  use Hippocrene

  test "title" do
    assert title("The Title") == {:title, "The Title"}
  end

  test "date" do
    expected = {:date, {2014, 8, 9}}

    assert date({2014, 8, 9}) == expected
    assert date( 2014, 8, 9 ) == expected
  end

  test "author" do
    assert author("Joe Honzawa") == {:author, "Joe Honzawa"}
  end

  test "begin" do
    assert (begin     "content") == "content"
    assert (begin do: "content") == "content"
    assert (begin do
      "content"
      "content"
    end) == ["content", "content"]
  end

  test "body" do
    assert (body     "content") == {:body, ["content"]}
    assert (body do: "content") == {:body, ["content"]}
    assert (body do
      "content"
      "content"
    end) == {:body, ["content", "content"]}
  end

  test "par" do
    assert (par     "content") == {:par, ["content"]}
    assert (par do: "content") == {:par, ["content"]}
    assert (par do
      "content"
      "content"
    end) == {:par, ["content", "content"]}
  end

  test "cite" do
    assert (cite     "content") == {:cite, ["content"]}
    assert (cite do: "content") == {:cite, ["content"]}
    assert (cite do
      "content"
      "content"
    end) == {:cite, ["content", "content"]}
  end

  test "item" do
    assert (item     "content") == {:item, ["content"]}
    assert (item do: "content") == {:item, ["content"]}
    assert (item do
      "content"
      "content"
    end) == {:item, ["content", "content"]}
  end

  test "table" do
    assert (table do: "content") == {:table, ["content"]}
  end

  test "section" do
    assert (section "Section 1",     "content") == {:section, "Section 1", ["content"]}
    assert (section "Section 1", do: "content") == {:section, "Section 1", ["content"]}
    assert (section "Section 1" do
      "content"
      "content"
    end) == {:section, "Section 1", ["content", "content"]}
  end

  test "code" do
    assert (code "elixir",     "content") == {:code, "elixir", ["content"]}
    assert (code "elixir", do: "content") == {:code, "elixir", ["content"]}
    assert (code "elixir" do
      "content"
      "content"
    end) == {:code, "elixir", ["content", "content"]}
  end

  test "list" do
    assert (list :bullet,  do: "content") == {:bullet, ["content"]}
    assert (list "bullet", do: "content") == {:bullet, ["content"]}

    assert (list :numbered,  do: "content") == {:numbered, ["content"]}
    assert (list "numbered", do: "content") == {:numbered, ["content"]}
  end

  test "header" do
    assert (header ["one", "two"]) == {:header, ["one", "two"]}
    assert (th     ["one", "two"]) == {:header, ["one", "two"]}
  end

  test "row" do
    assert (row ["one", "two"]) == {:row, ["one", "two"]}
    assert (td  ["one", "two"]) == {:row, ["one", "two"]}
  end

  test "integration" do
    article = begin do
      title  "The Title"
      date   2014, 8, 9
      author "Joe Honzawa"

      body do
        section "Section 1" do
          code "elixir" do
            "iex> 1+1"
            "2"
          end
          par do
            "Lorem ipsum"
          end
          list :bullet do
            item "one"
            item "two"
          end
        end
        section "Section 2" do
          table do
            th ["one", "two", "three"]
            td [    1,     2,       3]
            td [    1,     2,       3]
          end
        end
      end
    end
    expected = [
      title: "The Title",
      date: {2014, 8, 9},
      author: "Joe Honzawa",
      body: [
        {:section, "Section 1", [
          {:code, "elixir", ["iex> 1+1", "2"]},
          {:par, ["Lorem ipsum"]},
          {:bullet, [{:item, ["one"]}, {:item, ["two"]}]}
        ]},
        {:section, "Section 2", [
          table: [
            header: ["one", "two", "three"],
            row: [1, 2, 3],
            row: [1, 2, 3]
          ]
        ]}
      ]
    ]

    assert article == expected
  end
end
