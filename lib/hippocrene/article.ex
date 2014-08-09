defmodule Hippocrene.Article do
  import Hippocrene.Utils
  alias Hippocrene.Article
  alias Hippocrene.Article.Block

  defstruct title: "", date: {1970, 1, 1}, body: ""

  def title(title),          do: %__MODULE__{          title: title}
  def title(article, title), do: %__MODULE__{article | title: title}

  def date(y, m, d),          do: %__MODULE__{          date: {y, m, d}}
  def date(article, y, m, d), do: %__MODULE__{article | date: {y, m, d}}

  def date(date),          do: %__MODULE__{          date: date}
  def date(article, date), do: %__MODULE__{article | date: date}

  def body(article \\ %Article{}, content)

  def body(article, do: content) when is_list(content) do
    %Article{article | body: Enum.reverse content}
  end
  def body(article, do: content) do
    %Article{article | body: content}
  end

  def section(acc \\ [], section_title, content)

  def section(acc, section_title, do: content) when is_list(content) do
    [{:section, section_title, Enum.reverse content} | acc]
  end
  def section(acc, section_title, do: content) do
    [{:section, section_title, content} | acc]
  end

  def par(acc \\ [], content)

  def par(acc, do: content) when is_list(content) do
    [{:par, Enum.reverse content} | acc]
  end
  def par(acc, do: content) do
    [{:par, content} | acc]
  end

  def code(acc \\ [], language, content)

  def code(acc, language, do: content) when is_list(content) do
    [{:code, language, Enum.reverse content} | acc]
  end
  def code(acc, language, do: content) do
    [{:code, language, content} | acc]
  end

  def list(acc \\ [], type, content)

  def list(acc, :bullet, do: content) when is_list(content) do
    [{:ul, Enum.reverse content} | acc]
  end
  def list(acc, :bullet, do: content) do
    [{:ul, content} | acc]
  end

  def list(acc, :number, do: content) when is_list(content) do
    [{:ol, Enum.reverse content} | acc]
  end
  def list(acc, :number, do: content) do
    [{:ol, content} | acc]
  end

  def item(acc \\ [], content)

  def item(acc, do: content) when is_list(content) do
    [{:li, Enum.reverse content} | acc]
  end
  def item(acc, do: content) do
    [{:li, content} | acc]
  end

  def begin(do: block) do
    block # TODO
  end
end
