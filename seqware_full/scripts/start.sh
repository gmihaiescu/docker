#!/usr/bin/env bash
set -o errexit
set -o pipefail

# kick off all services

ansible-playbook /mnt/home/seqware/seqware-bag/docker-start.yml -c local --extra-vars "single_node=True"
sudo nohup cron -f &
cd ~seqware
source ~seqware/.bash_profile
source ~seqware/.bashrc 
sudo -E -u seqware -i ${1-bash} 
