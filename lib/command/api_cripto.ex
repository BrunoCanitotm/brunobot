defmodule Brunobot.Command.ApiCripto do
  @moduledoc false

  @api_url "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,dogecoin&vs_currencies=usd"

  def preco_cripto do
    case Req.get(@api_url) do
      {:ok, %{status: 200, body: dados}} ->
        """
        💰 Cotações:
        Bitcoin: $#{dados["bitcoin"]["usd"]}
        Ethereum: $#{dados["ethereum"]["usd"]}
        Dogecoin: $#{dados["dogecoin"]["usd"]}
        """

      {:error, reason} ->
        "❌ Erro na API: #{inspect(reason)}"

      _ ->
        "❌ Resposta inesperada"
    end
  end
end
