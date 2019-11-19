#!/bin/sh

echo "- Starting docker..."
docker run -d -v /opt/WebMap/docker/xml:/opt/xml -p 8000:8000 webmap:latest > /dev/null
echo "+ Docker has been started...\n"
echo "- Getting docker ID and generating token..."
_id=$(docker ps | grep webmap | cut -d ' ' -f1)
_token=$(docker exec -ti $_id python3 /root/token | grep Token | cut -d ' ' -f2)
echo "+ Token: $_token"