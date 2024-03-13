# Use uma imagem base que tenha o ambiente necessário para executar o seu executável
FROM ubuntu:latest

WORKDIR /usr/local/bin

COPY Back-BabyDicionario/dicionario_do_bebe .
COPY Back-BabyDicionario/src/assets src/assets

RUN apt-get update && apt-get install -y \
  libatomic1 \
  libssl-dev \
  libpq-dev \
  postgresql-server-dev-all

EXPOSE 3035

CMD ["./dicionario_do_bebe"]
