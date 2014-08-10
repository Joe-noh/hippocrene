defmodule Hippocrene.Mixfile do
  use Mix.Project

  def project do
    [app: :hippocrene,
     version: "0.0.1",
     elixir: "~> 0.15.0",
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  defp package do
    [
      files: ["lib", "vendor", "mix.exs", "README*", "LICENSE*"],
      contributors: ["Joe Honzawa"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/Joe-noh/hippocrene"}
    ]
  end

  # Dependencies can be hex.pm packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    []
  end
end
