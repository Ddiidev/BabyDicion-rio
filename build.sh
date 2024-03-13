#!/bin/bash

exist_jwt=false
for item in $(v list); do
    if [ "$item" == "jwt" ]; then
        exist_jwt=true
        break
    fi
done


v install

if [ "$exist_jwt" = false ]; then
    v install https://github.com/Ddiidev/jwt
fi

v -prod . -o dicionario_do_bebe

docker-compose up --build