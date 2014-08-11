defmodule Hippocrene.Mixfile do
  use Mix.Project

  def project do
    [app: :hippocrene,
     version: "0.0.1",
     elixir: "~> 0.15.0",
     package: package,
     deps: deps]
  end

  def application do
    [applications: [:logger, :cowboy, :plug]]
  end

  defp package do
    [
      files: ["lib", "vendor", "mix.exs", "README*", "LICENSE*"],
      contributors: ["Joe Honzawa"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/Joe-noh/hippocrene"}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 0.5.3"}
    ]
  end
end
