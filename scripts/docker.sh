#!/bin/bash

set -e

# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04

#apt update && \
#apt install -y apt-transport-https ca-certificates curl software-properties-common && \
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor --batch --yes -o /usr/share/keyrings/docker-archive-keyring.gpg && \
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
#apt update && \
#apt-cache policy docker-ce && \
#apt install -y docker-ce && \
#sleep 10 && \
#usermod -aG docker ubuntu

printf "==> Configure /etc/docker/daemon.json\n"
#echo '{"exec-opts": ["native.cgroupdriver=systemd"]}' | python3 -m json.tool > /etc/docker/daemon.json && \
#systemctl daemon-reload && \
#systemctl restart docker && \
#systemctl status -l docker && \

#sleep 5 && \

printf "==> Running hello-world docker container test \n"
#docker run hello-world

exit 0
