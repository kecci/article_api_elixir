defmodule ArticleApiElixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :article_api_elixir,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ArticleApiElixir.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.11"},
      {:cowboy, "~> 2.9"},
      {:plug_cowboy, "~> 2.5"},
      {:jason, "~> 1.2"}
    ]
  end
end
