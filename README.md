# brunobot
BRUNOBOT - Bot de Discord em Elixir
SpaceBot é um bot de Discord desenvolvido em Elixir como projeto acadêmico, explorando o poder da programação funcional para interações criativas no Discord.

- Contexto do Projeto:
Este bot foi criado para a disciplina de Programação Funcional com os seguintes objetivos:

Implementar conceitos avançados de programação funcional

Demonstrar o uso de Elixir em projetos reais

Integrar diversas APIs públicas de forma eficiente

Criar uma arquitetura modular e de fácil manutenção

Utilizar Docker para conteinerização e deploy

- Stack Tecnológica
Elixir: Linguagem funcional para toda a lógica do bot

Nostrum: Biblioteca para integração com a API do Discord

Req: Cliente HTTP para consumo de APIs externas

Docker: Empacotamento e distribuição em containers

- Funcionalidades Principais
!ping: Testa a conectividade do bot

!receita: mostra uma receita e o video dela no youtube.

!nasa: mostra uma foto aleatoria do dia da nasa

!cripto: mostra o valor de algumas criptomoedas(BTC, ETH, DOG)

!livro: mosrando um livro aleatorio e seu autor

!dog: mostra uma foto de um cachorro fofo aleatorio

!arte: exibe uma pintura aleatoria e seu artista

!meme: mostra algum meme aletorio do reddit

 APIs Integradas
NASA API: Para imagens e dados espaciais

 Instalação e Uso
Pré-requisitos
Elixir 1.14+ instalado

Token válido do Discord Bot

Método Tradicional
bash
git clone https://github.com/seuuser/brunobot.git
cd brunobot
mix deps.get
mix compile
mix run --no-halt
Via Docker
bash
docker build -t brunobot .
docker run -e DISCORD_BOT_TOKEN=seu_token brunobot
Variáveis de Ambiente
Crie um arquivo .env com:

DISCORD_BOT_TOKEN=seu_token_aqui
🤝 Contribuição
Contribuições são bem-vindas! Abra uma issue ou submeta um pull request.
