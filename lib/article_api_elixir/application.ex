defmodule ArticleApiElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do

    port = System.get_env("PORT") || "8080" |> String.to_integer()

    children = [
      {Plug.Cowboy, scheme: :http, plug: Routes, options: [port: port]},
      {ArticleApi.ArticleService, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ArticleApiElixir.Supervisor]
    Logger.info("Server started at port " <> Integer.to_string(port))
    Supervisor.start_link(children, opts)
  end
end
