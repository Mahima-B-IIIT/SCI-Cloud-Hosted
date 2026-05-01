#!/bin/bash

echo "Stopping old containers..."
docker stop cloud ne-edge sw-edge frontend \
            sensor-north sensor-south sensor-east sensor-west 2>/dev/null

docker rm cloud ne-edge sw-edge frontend \
          sensor-north sensor-south sensor-east sensor-west 2>/dev/null


echo "Creating network..."
docker network create weather-net 2>/dev/null


echo "Starting Edge Servers..."

docker run -d \
 --name ne-edge \
 --network weather-net \
 -p 5001:5001 \
 weather-edge python ne_edge.py


docker run -d \
 --name sw-edge \
 --network weather-net \
 -p 5002:5002 \
 weather-edge python sw_edge.py


sleep 3


echo "Starting Cloud Server..."

docker run -d \
 --name cloud \
 --network weather-net \
 -p 8000:8000 \
 weather-cloud


sleep 3


echo "Starting Sensors..."

docker run -d \
 --name sensor-north \
 --network weather-net \
 weather-sensor python north.py

docker run -d \
 --name sensor-south \
 --network weather-net \
 weather-sensor python south.py

docker run -d \
 --name sensor-east \
 --network weather-net \
 weather-sensor python east.py

docker run -d \
 --name sensor-west \
 --network weather-net \
 weather-sensor python west.py


echo "Starting Frontend..."

docker run -d \
 --name frontend \
 --network weather-net \
 -p 8080:80 \
 weather-frontend


echo "================================="
echo "System Started Successfully 🚀"
echo "Frontend: http://localhost:8080"
echo "Cloud API: http://localhost:8000/global_stats"
echo "================================="
