defmodule Hippocrene do

  defmacro __using__(_) do
    quote do
      import Hippocrene.Article
    end
  end
end
