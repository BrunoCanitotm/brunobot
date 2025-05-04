defmodule Brunobot do
  use Nostrum.Consumer
  alias Brunobot.Command.ApiNasa

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case msg.content do
      # Comandos de API
      "!nasa" ->
        Nostrum.Api.Message.create(msg.channel_id, ApiNasa.foto_do_dia())

      "!cripto" ->
        Nostrum.Api.Message.create(msg.channel_id,Brunobot.Command.ApiCripto.preco_cripto())

      "!ping" ->
        Nostrum.Api.Message.create(msg.channel_id, "🏓 Pong!")

        "!livro" ->
      Nostrum.Api.Message.create(msg.channel_id,Brunobot.Command.ApiLivro.recomendar_livro())

     "!dog" ->
      Nostrum.Api.Message.create(msg.channel_id,Brunobot.Command.ApiAnimal.foto_fofa())

      "!arte" ->
      Nostrum.Api.Message.create(msg.channel_id,Brunobot.Command.ApiArte.obra_aleatoria())

      "!receita" ->
      Nostrum.Api.Message.create(msg.channel_id,Brunobot.Command.ApiReceita.receita_aleatoria())

      "!meme" ->
      Nostrum.Api.Message.create(msg.channel_id,Brunobot.Command.ApiMeme.meme_aleatorio())

      _ ->
        :ignore
    end
  end

  def handle_event({:READY, _data, _ws_state}) do
    IO.puts("Bot conectado e pronto!")
    :ok
  end
end
