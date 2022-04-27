defmodule ArticleApi.ArticleService do

  # Agent abstraksi state global persistent
  use Agent

  # Alias for reuse
  alias ArticleApi.ArticleService.Article

  def start_link (_) do
    Agent.start_link(fn -> []end, name: Store)
  end
  def get_all_articles() do
    articles = Agent.get(Store, fn data -> data end)
    {:ok, articles}
  end

  def get_one_article(id) do
    articles = Agent.get(Store, fn data ->
      Enum.find(data, fn item -> item.id == String.to_integer(id) end)
    end)
    {:ok, articles}
  end

  def add_article(%{"id" => id, "title" => title, "excerpt" => excerpt, "body" => body}) do
    # get article by id
    article = %Article{id: id, title: title, excerpt: excerpt, body: body}

    Agent.update(Store, fn articles -> [article | articles] end)
    {:ok, "Article Created"}
  end

  def update_article(id, %{"title" => title, "excerpt" => excerpt, "body" => body}) do
    # get article by id
    {:ok, article} = get_one_article(id)

    # update article
    updated_article = %{article | id: article.id, title: title, excerpt: excerpt, body: body}

    # remove old article
    _ = delete_article(id)

    # put it back updated article
    Agent.update(Store, fn articles -> [updated_article | articles] end)
    {:ok, "Article Updated"}
  end

  def delete_article(id) do
    Agent.update(Store, fn data ->
      Enum.filter(data, fn item -> item.id != String.to_integer(id) end)
    end)

    {:ok, "Article Deleted"}
  end

end
