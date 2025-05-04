# lib/brunobot/config/secrets_template.ex
defmodule Brunobot.Config.Secrets do
  @moduledoc """
  Template para configuração de chaves API.
  Renomeie para secrets.ex e preencha com suas chaves.
  """

  # Discord Bot Token
  def discord_token, do: System.get_env("DISCORD_TOKEN") || "token_development"

  # NASA API
  def nasa_api_key, do: System.get_env("NASA_API_KEY") || "DEMO_KEY"

  # OpenWeatherMap


  # The Movie Database


  # CoinGecko (opcional)
  def coingecko_key, do: System.get_env("COINGECKO_KEY") || nil

  # Configuração para testes
  if Mix.env() == :test do
    def nasa_api_key, do: "Na38YszwvNWjL7Du5x2pgbgOAhKXh3d35avyCYaC"
    def discord_token, do: "MTM2ODIyMTEzMzkxMjE0NjAyMQ.G7uKaz.NrqHsDl148yrxGxz3tVzj6auqky2gRqoQdJOtw"
   # def openweather_key, do: "3aa71105e82dc0c18d9c234be50d299b"
    #def tmdb_key, do:"eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NjE2NWU5ZTZlMjc4NWVlMmU4ODg5YzJkMjJjMmZjYyIsIm5iZiI6MTc0NjI5OTQ0MS4wODQsInN1YiI6IjY4MTY2YTMxNzQ1NTcwYjRmMzkwODFhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.O6ecjN-DY4TuFFehwd5eqaKFD_DB9WUMdzRHspnhyJY"
  end
end
