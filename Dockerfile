# Use a imagem base do Elixir e do Phoenix
FROM elixir:latest

# Instale as dependências do sistema
RUN apt-get update && \
    apt-get install -y build-essential inotify-tools

# Crie o diretório de trabalho no container
WORKDIR /app

# Copie os arquivos necessários para o diretório de trabalho
COPY . .

# Instale as dependências do mix
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

# Compile o projeto
RUN mix compile

# Exponha a porta em que o Phoenix está rodando
EXPOSE 4000

# Execute o comando para iniciar o servidor Phoenix
CMD ["mix", "phx.server"]