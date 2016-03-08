defmodule Hackshop.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hackshop,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [
        :logger, :cowboy, :plug, :httpoison
      ],
      mod: {Hackshop, []}
    ]
  end

  defp deps do
    [
      {:exprotobuf, "~> 1.0"  },
      {:plug,       "~> 1.1"  },
      {:cowboy,     "~> 1.0"  },
      {:amnesia,    "~> 0.2.1"},
      {:httpoison,  "~> 0.8.1"},
    ]
  end
end
