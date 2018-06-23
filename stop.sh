#!/bin/bash

echo " stop game Server ......"
docker-compose exec game_server stop_gs
docker-compose stop