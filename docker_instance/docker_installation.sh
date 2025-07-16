#!/bin/bash

#1.install plugins
sudo dnf -y install dnf-plugins-core
#2.add repo
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
#3. install docker engine
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#start and enable docker service
sudo systemctl start docker
sudo systemctl enable docker

#normal user cannot run docker. but it's not recommended to use root user to run containers
# so the solution for this is we should add nrml user to docker group

sudo usermod -aG docker ec2-user 