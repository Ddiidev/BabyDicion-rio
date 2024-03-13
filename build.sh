#!/bin/bash

exist_jwt=false
for item in $(v list); do
    if [ "$item" == "jwt" ]; then
        exist_jwt=true
        break
    fi
done

cd Back-BabyDicionario/

v install

if [ "$exist_jwt" = false ]; then
    v install https://github.com/Ddiidev/jwt
fi

echo "Compilando a api"
v -prod . -o dicionario_do_bebe

cd ..

echo "instalando nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

echo "Instalando nodejs"
nvm install node

cd Front-BabyDicionario/

npm install

npm run build

cp -r dist/ ../

cd ..

docker-compose up --build