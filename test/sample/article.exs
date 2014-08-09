use Hippocrene

begin do
  title("The Title")
  |> date(2014, 8, 9)
  |> body do
    section "Section 1" do
      code "elixir" do
        """
        iex> 1+1
        2
        """
      end
      |>
      par do
        """
        The Body.
        The Body.
        """
      end
    end
  end
end
