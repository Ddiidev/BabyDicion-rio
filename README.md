
![68747470733a2f2f696d6775722e636f6d2f744c376a4b34312e706e67](https://github.com/Ddiidev/BabyDicionario/assets/7676415/bb28df35-3ac3-4379-944d-c7a1166ba8cf)

# 

Esse era um projeto que comecei para utilizar apenas para mim e minha família 🧑🏻‍👩🏾‍👦🏻, e decidi transformar em algo em que mais familias possam utilizar.

Eu identifiquei que mais familias também iriam gostar de ter um timeline do que os seus filhos falavam, e como falavam, e como foi a progressão de cada palavra.

E poder acompanhar isso no futuro (infelizmente e felizmente bem próximo) é mágico 🪄.


## Demonstração

> https://github.com/user-attachments/assets/cb8d382d-483d-4364-991e-dcf93e0dee8a



## Clonando repo

Clone o projeto

```bash
  git clone https://github.com/Ddiidev/BabyDicionario
```

Entre no diretório do projeto e rode mais esse comando para clonar os submodules

```bash
  cd BabyDicionario
  git submodule update --init --recursive --rebase --force
```
## Rodando localmente

### Vamos começar pelo front-end

> [!NOTE]
> Se estiver utilizando windows/linux/mac lembre-se de ter instalado o node e npm previamente.
> Indico utilizar o **nvm** para instalar uma versão mais recente do node.

Instale as dependências para o front-end

```bash
  cd Front-BabyDicionario/
  npm install
```

Inicie a aplicação

```bash
  npm run dev
```

### Vamos agora dá vida ao backend

Precisamos baixar o compilador e algumas bibliotecas.

**Abra um terminal como ADM**
```bash
cd Back-BabyDicionario\
git clone https://github.com/vlang/v
cd v\
make
v symlink
```

### Instalação das lib de banco de dados.

Como é um processo um pouco mais extenso de acordo com o OS que esteja utilizando, vou deixar que a própria documentação do Vlang, lhe guie...

Para Sqlite: https://modules.vlang.io/db.sqlite.html

Para Postgresql: https://modules.vlang.io/db.pg.html

_É necessário ambos estarem devidamente instalados, mesmo que esse readm esteja focado no sqlite._

> [!Note]
> Importante lembrar que se caso estiver no **windows**, deve ser copiado os seguintes arquivos para a pasta Back-BabyDicionario/
> - libcrypto-3-x64.dll
> - libintl-9.dll
> - libpq.dll
> - libssl-3-x64.dll

### Vamos instalar as dependências

```bash
v install
v install https://github.com/Ddiidev/jwt
```


### Variáveis de ambiente

Abaixo um exemplo de como deve configurar as variáveis de ambiente em seu OS.
Estou dando um exemplo com o brevo, mas poderia usar outra, não recomento gmail por ser muito restritivo.

```
BABYDI_SMTP_SERVER=smtp-relay.brevo.com
BABYDI_SMTP_SERVER_PORT=587
BABYDI_SMTP_USERNAME=MY USERNAME FROM LOGIN ON BREVO
BABYDI_SMTP_PASSWORD=MY PASSWORD FROM LOGIN ON BREVO
BABYDI_SMTP_EMAIL_FROM=MY EMAIL SENDER ON BREVO
BABYDI_PATH_DB=E:\BabyDicionario\Back-BabyDicionario\db_local\dbaby.sqlite
```

### Vamos rodar o backend

```bash
v -d dev run .
```

Resultado:
```bash
> v -d dev run .
[Vweb] Running app on http://localhost:3035/
```
## Rodando com docker

> [!NOTE]
> É necessário já ter o git e docker instalado.

A compilação não é feita dentro do container, tanto para o backend quanto o frontend, toda a compillção é feita fora, fiz isso pra tornar o pocesso mais rápido.

Na sua maquina host, execute:

```bash
sudo apt update && sudo apt upgrade
sudo apt install build-essential
```

Instalar biblioteca C para banco de dados sqlite e postgresql:

```bash
sudo apt install -y libsqlite3-dev
sudo apt-get install postgresql postgresql-client
sudo systemctl enable postgresql # to autostart on startup
sudo systemctl start  postgresql
```

Vamos clonar o compilador:

```bash
git clone https://github.com/vlang/v
cd v
make
sudo ./v symlink
```

Vamos comoeçar o processo de build e execução do container, execute o build.sh

```bash
sudo sh ./build.sh
```

_Deve começar a instalar as dependências do projeto backend e buildar para produção._

_Vai instalar o nvm e node do projeto do frontend e buildar para produção._

> [!NOTE]
> Talvez seja necessário ajustar seu arquivo host com o ip apontado corretamente. (Não tenho certeza!)
> 
> localhost app.dicionariodobebe.fun
> 
> localhost api.dicionariodobebe.fun
