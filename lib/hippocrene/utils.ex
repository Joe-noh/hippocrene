defmodule Hippocrene.Utils do

  def formatted_today() do
    {{y, m, d}, _} = :calendar.local_time()
    "#{y}-#{m}-#{d}"
  end
end
