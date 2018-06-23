#!/bin/bash

docker-compose up -d
echo " start game Server ......"
sleep 15
docker-compose exec -d game_server run_gs