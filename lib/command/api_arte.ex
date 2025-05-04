defmodule Brunobot.Command.ApiArte do
  @moduledoc """
  Mostra obras de arte aleatórias do Metropolitan Museum of Art (MET).
  """

  @api_url "https://collectionapi.metmuseum.org/public/collection/v1/objects"

  def obra_aleatoria do
    # Primeiro busca IDs de obras
    case Req.get(@api_url) do
      {:ok, %{status: 200, body: %{"objectIDs" => [_ | _] = ids}}} ->  # Corrigido aqui
        id_aleatorio = Enum.random(ids)
        buscar_detalhes_obra(id_aleatorio)

      {:ok, %{status: 200, body: %{"objectIDs" => []}}} ->
        "🖼️ Nenhuma obra disponível no momento"

      {:error, reason} ->
        "❌ Erro ao buscar arte: #{inspect(reason)}"

      _ ->
        "🖼️ Galeria fechada para manutenção"
    end
  end

  defp buscar_detalhes_obra(id) do
    case Req.get("#{@api_url}/#{id}") do
      {:ok, %{status: 200, body: %{"title" => titulo, "primaryImageSmall" => imagem, "artistDisplayName" => artista}}} ->
        """
        🎨 #{titulo}
        👨‍🎨 #{artista || "Artista desconhecido"}
        #{imagem || "Sem imagem disponível"}
        """

      _ ->
        # Corrigido: Chamada direta sem & e then/2
        obra_aleatoria()  # Simplesmente chama a função novamente
    end
  end
end
