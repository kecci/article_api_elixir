defmodule Routes do
  use Plug.Router
  alias ArticleApi.ArticleService

  plug(:match)
  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Jason)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, Jason.encode!(%{"status" => "OK"}))
  end

  get "/article" do
    {:ok, articles} = ArticleService.get_all_articles()
    send_resp(conn, 200, Jason.encode!(articles))
  end

  get "/article/:id" do
    {:ok, article} = ArticleService.get_one_article(id)
    send_resp(conn, 200, Jason.encode!(article))
  end

  post "/article" do
    {:ok, message} = ArticleService.add_article(conn.body_params)
    send_resp(conn, 200, Jason.encode!(%{"message" => message}))
  end

  put "/article/:id" do
    {:ok, message} = ArticleService.update_article(id, conn.body_params)
    send_resp(conn, 200, Jason.encode!(%{"message" => message}))
  end

  delete "/article/:id" do
    {:ok, message} = ArticleService.delete_article(id)
    send_resp(conn, 200, Jason.encode!(%{"message" => message}))
  end

end
