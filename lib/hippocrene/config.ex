defmodule Hippocrene.Config do
  def get(key) do
    Application.get_env(:hippocrene, key)
  end
end
