#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o xtrace

# This is ugly but docker does not support symlinks
cp wrapdocker seqware_whitestar
cp wrapdocker seqware_whitestar_pancancer
cp wrapdocker seqware_full
cp wrapdocker seqware_full_pancancer
docker build --tag seqware/whitestar_dind --file=seqware_whitestar/Dockerfile .
docker build --tag seqware/whitestar_pancancer_dind --file=seqware_whitestar_pancancer/Dockerfile .
docker build --tag seqware/full_dind --file=seqware_full/Dockerfile .
docker build --tag seqware/full_pancancer_dind --file=seqware_full_pancancer/Dockerfile .
