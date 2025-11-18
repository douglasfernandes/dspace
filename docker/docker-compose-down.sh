# Desativa o serviço
docker compose -p d8 -f docker-compose.yml -f docker-compose-rest.yml down

function d8rm() {
  ./docker-compose-all-down.sh
  docker rm d8_dspace d8_dspacedb d8_dspacesolr d8_dspace-angular
  docker stop dspace dspacedb dspacesolr dspace-angular
  docker volume rm d8_pgdata d8_assetstore d8_solr_data
  docker volume prune -f
}

#test de porta
#docker exec -it dspace-angular sh
#nc -v dspacedb 5432

