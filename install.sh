#!/bin/bash
sudo dnf clean all
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-updates-modular.repo
sudo sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/fedora-modular.repo
sudo dnf upgrade --best --allowerasing --refresh -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
ansible-playbook local.yml