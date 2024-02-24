#!/bin/sh

IMAGE=starefossen/github-pages:latest
CONTAINER_NAME=wreath

docker run --rm -it --name "$CONTAINER_NAME" \
  -p 5000:5000 \
  -v "$PWD:/usr/src/app:ro" \
  -e JEKYLL_ENV=development \
  "$IMAGE" \
  jekyll serve \
    --host 0.0.0.0 --port 5000 -s /usr/src/app -d /tmp/_site \
    --watch --force_polling --safe
