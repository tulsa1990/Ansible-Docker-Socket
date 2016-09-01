#docker run -it --rm alpine-ansible bash

docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD":/root/ docker-ansible bash