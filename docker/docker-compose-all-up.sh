#!/bin/bash
#Autor: Douglas Fernandes / UFPB
export DOCKER_OWNER="dspace"
export DSPACE_VER="dspace-8.1"
export DSPACE_SSL="false"

#Obtém o IP
export DSPACE_HOST="$(hostname -I | cut -f 1 -d' ')"
export REST_PORT="8080"
export UI_PORT="4000"
export DSPACE_NET="172.21.0" #172.21.0.0
docker network create --subnet=${DSPACE_NET}.0/16 dspacenet

#download das imagens
docker compose -p d8 -f docker-compose.yml -f docker-compose-rest.yml pull 

#Inicia o serviço
docker compose -p d8 -f docker-compose.yml -f docker-compose-rest.yml up -d

#Função para criar um administrador no dspace
function newAdm() {
  docker pull dspace/dspace-cli:dspace-8.1
  docker compose -p d8 -f docker-compose-cli.yml run --rm dspace-cli create-administrator -e douglas@sti.ufpb.br -f admin -l user -p admin -c pt-BR
}


