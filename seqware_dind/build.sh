#!/usr/bin/env bash
set -o errexit
set -o pipefail

docker build --tag seqware/seqware_whitestar_dind --file=Dockerfile.seqware_whitestar .
docker build --tag seqware/seqware_whitestar_pancancer_dind --file=Dockerfile.seqware_whitestar_pancancer .
docker build --tag seqware/seqware_full_dind --file=Dockerfile.seqware_full .
docker build --tag seqware/seqware_full_pancancer_dind --file=Dockerfile.seqware_full_pancancer .
