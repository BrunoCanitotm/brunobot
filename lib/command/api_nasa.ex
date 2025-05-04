defmodule Brunobot.Command.ApiNasa do
  @moduledoc false

  @api_url "https://api.nasa.gov/planetary/apod?api_key=NASA_API_KEY"

  def foto_do_dia do
    case Req.get(@api_url) do
      {:ok, %{status: 200, body: %{"url" => url, "title" => title}}} ->
        "🚀 #{title}\n#{url}"

      {:error, reason} ->
        "❌ Erro ao acessar a NASA: #{inspect(reason)}"

      _ ->
        "❌ Resposta inesperada da NASA"
    end
end
end
