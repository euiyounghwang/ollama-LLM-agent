#!/bin/bash

set -eu

SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

docker run --rm --platform linux/amd64 -it -d \
  --name fn-ollama-api --publish 17777:7777 --expose 7777 \
  --network bridge \
  -e ES_HOST=http://host.docker.internal:9203 \
  -v "$SCRIPTDIR:/app/FN-Basic-Ollama-Services/" \
  fn-ollama-api:es