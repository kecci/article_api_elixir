defmodule ArticleApiElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Routes, options: [port: 4000]},
      {ArticleApi.ArticleService, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ArticleApiElixir.Supervisor]
    Logger.info("Server started at port 4000")
    Supervisor.start_link(children, opts)
  end
end
