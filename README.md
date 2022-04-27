# ArticleApiElixir

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `article_api_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:article_api_elixir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/article_api_elixir>.

## Elixir Tutorial REST Project
https://www.youtube.com/watch?v=jEHI7IcBUBQ&t=106s

## Initiate Project
https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html

Init:
```sh
mix new article_api_elixir --sup
```

## Setup Project

setup dependencies On `mix.exs`:
```ex
defp deps do
    [
      {:plug, "~> 1.11"},
      {:cowboy, "~> 2.9"},
      {:plug_cowboy, "~> 2.5"},
      {:jason, "~> 1.2"}
    ]
  end
```

Setup rest config On `lib/article_api_elixr/application.ex`
```ex
    children = [
      {Plug.Cowboy, scheme: :http, plug: Routes, options: [port: 4000]}
    ]
```

Create new routes file On `lib/article_api_elixr/routes.ex`
```ex
defmodule Routes do
  use Plug.Router

  plug(:match)
  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Jason)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, Jason.encode!(%{"status" => "OK"}))
  end
end
``` 

### Run Project
```sh
mix run --no-halt
```