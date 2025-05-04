FROM elixir:1.18.3-alpine

ARG DISCORD_TOKEN
ENV DISCORD_TOKEN=${DISCORD_TOKEN}

# 1. Instala dependências essenciais
RUN apk add --no-cache build-base git openssl bash

# 2. Configura ambiente
ENV MIX_ENV=prod

# 3. Diretório de trabalho
WORKDIR /app

# 4. Copia arquivos básicos
COPY mix.exs mix.lock ./

# 5. Instala dependências
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only $MIX_ENV

# 6. Copia o código fonte (com verificação de pastas)
COPY lib lib/
COPY config config/
# Cria priv vazia se não existir
RUN mkdir -p priv

# 7. Compilação
RUN mix compile

# 8. Cria release
RUN mix release

# 9. Comando de execução
CMD ["_build/prod/rel/brunobot/bin/brunobot", "start"]