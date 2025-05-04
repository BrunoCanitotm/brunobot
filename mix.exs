defmodule Brunobot.MixProject do
  use Mix.Project

  def project do
    [
      app: :brunobot,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Brunobot.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:nostrum, "~> 0.8"},
      {:req, "~> 0.4.12"},
      {:httpoison, "~> 1.8"},
      {:timex, "~> 3.7"},
      {:jason, "~> 1.2"}
    ]
  end
end
