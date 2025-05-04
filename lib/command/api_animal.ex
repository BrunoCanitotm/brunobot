defmodule Brunobot.Command.ApiAnimal do
  @moduledoc """
  Mostra fotos de cachorros usando a API Dog CEO (100% gratuita e estável)
  """

  @api_url "https://dog.ceo/api/breeds/image/random"

  def foto_fofa do
    case Req.get(@api_url) do
      {:ok, %{status: 200, body: %{"message" => url, "status" => "success"}}} ->
        "🐶 Aqui está um doguinho fofo para você!\n#{url}"

      {:ok, %{status: 200, body: %{"status" => "error"}}} ->
        "❌ A API está com problemas técnicos. Tente novamente mais tarde!"

      {:error, reason} ->
        "⚠️ Erro de conexão: #{inspect(reason)}"

      _ ->
        "🔌 Problema inesperado. Verifique sua internet!"
    end
  end
end
