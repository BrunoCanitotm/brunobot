defmodule Brunobot.Command.ApiLivro do
  @moduledoc """
  Recomenda livros usando a API da Open Library.
  """

  @api_url "https://openlibrary.org/trending/daily.json"

  def recomendar_livro do
    case Req.get(@api_url) do
      {:ok, %{status: 200, body: %{"works" => [_ | _] = livros}}} ->
        livro = Enum.random(livros)
        formatar_livro(livro)

      {:ok, %{status: 200, body: _}} ->
        "📚 Nenhum livro em destaque hoje"

      {:error, reason} ->
        "❌ Erro ao buscar livros: #{inspect(reason)}"

      _ ->
        "📖 Serviço indisponível no momento"
    end
  end

  defp formatar_livro(livro) do
    titulo = livro["title"]
    autor = get_in(livro, ["author_name", Access.at(0)]) || "Autor desconhecido"
    ano = livro["first_publish_year"] || "Ano não informado"

    """
    📖 Recomendação literária:
    Título: #{titulo}
    Autor: #{autor}
    Publicação: #{ano}
    """
  end
end
