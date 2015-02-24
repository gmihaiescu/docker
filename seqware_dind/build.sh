#!/usr/bin/env bash
set -o errexit
set -o pipefail

docker build --tag seqware/whitestar_dind --file=seqware_whitestar/Dockerfile .
docker build --tag seqware/whitestar_pancancer_dind --file=seqware_whitestar_pancancer/Dockerfile .
docker build --tag seqware/full_dind --file=seqware_full/Dockerfile .
docker build --tag seqware/full_pancancer_dind --file=seqware_full_pancancer/Dockerfile .
