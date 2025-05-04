defmodule Brunobot.Command.ApiMeme do
  @moduledoc """
  Pega memes fresquinhos do Reddit!
  """

  @subreddits ~w(memes dankmemes MemeEconomy wholesomememes)
  @api_url "https://meme-api.com/gimme/"

  def meme_aleatorio do
    sub = Enum.random(@subreddits)

    case Req.get(@api_url <> sub) do
      {:ok, %{status: 200, body: %{"url" => url, "title" => titulo}}} ->
        "😂 #{titulo}\n#{url}"

      {:ok, %{status: 200, body: %{"message" => msg}}} ->
        "🤖 O robô de memes disse: #{msg}"

      {:error, reason} ->
        "❌ Erro ao buscar meme: #{inspect(reason)}"

      _ ->
        "🎭 A fábrica de memes quebrou... Tente novamente!"
    end
  end
end
