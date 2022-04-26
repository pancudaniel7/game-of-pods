#!/bin/bash

# run this from main project folder

docker network create redis --driver bridge

for j in `seq 1 6`; do
docker run --network redis -d -v \
$PWD/deployments/redis/config/cluster-config.yaml:/usr/local/etc/redis/redis.conf \
--name redis-"$j" \
redis redis-server /usr/local/etc/redis/redis.conf;
done

sleep 5

ips=$(for i in `seq 1 6`; do docker inspect -f '{{ (index .NetworkSettings.Networks "redis").IPAddress }}' redis-$i;done)

ips_line=""
i=0
for ip in ${ips[@]}; do
	ips_line+=$ip":6379 "
	i=$(expr $i + 1)
done

echo Created cluster for hosts: $ips_line

docker exec -it $(docker ps | grep -i redis-1 | cut -d" " -f1) redis-cli --cluster-replicas 1 --cluster create $ips_line

