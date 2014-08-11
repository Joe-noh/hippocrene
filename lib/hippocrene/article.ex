defmodule Hippocrene.Article do

  def title(title), do: {:title, title}

  def date(year, month, day),         do: {:date, {year, month, day}}
  def date(date) when is_tuple(date), do: {:date, date}

  def author(author), do: {:author, author}

  defmacro begin(do: {:__block__, _, blocks}), do: blocks
  defmacro begin(do: blocks), do: blocks
  defmacro begin(blocks), do: blocks

  @tags [:body, :par, :cite, :code, :item, :table]
  Enum.each @tags, fn (tag) ->
    defmacro unquote(tag)(do: {:__block__, _, blocks}) do
      tag = unquote(tag)
      quote do: {unquote(tag), unquote(blocks)}
    end

    defmacro unquote(tag)(do: line) do
      tag = unquote(tag)
      quote do: {unquote(tag), [unquote line]}
    end

    defmacro unquote(tag)(line) do
      tag = unquote(tag)
      quote do: {unquote(tag), [unquote line]}
    end
  end

  @tags_with_one_arg [:section, :code]
  Enum.each @tags_with_one_arg, fn (tag) ->
    defmacro unquote(tag)(arg, do: {:__block__, _, blocks}) do
      tag = unquote(tag)
      quote do: {unquote(tag), unquote(arg), unquote(blocks)}
    end

    defmacro unquote(tag)(arg, do: line) do
      tag = unquote(tag)
      quote do: {unquote(tag), unquote(arg), [unquote line]}
    end

    defmacro unquote(tag)(arg, line) do
      tag = unquote(tag)
      quote do: {unquote(tag), unquote(arg), [unquote line]}
    end
  end

  # define list(:bullet) and list(:numbered)
  @list_styles [:bullet, :numbered, "bullet", "numbered"]
  Enum.each @list_styles, fn (style) ->
    style_atom = if is_atom(style) do
      style
    else
      String.to_atom style
    end

    defmacro list(unquote(style), do: {:__block__, _, blocks}) do
      style_atom = unquote(style_atom)
      quote do: {unquote(style_atom), unquote(blocks)}
    end

    defmacro list(unquote(style), do: line) do
      style_atom = unquote(style_atom)
      quote do: {unquote(style_atom), [unquote line]}
    end
  end

  def header(headers), do: {:header, headers}
  def th(headers),     do: {:header, headers}

  def row(data), do: {:row, data}
  def td(data),  do: {:row, data}
end
