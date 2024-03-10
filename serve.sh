#!/bin/sh

if which nix-shell >/dev/null; then
  builddir=$(mktemp -d)
  trap 'rm -rf "$builddir"' "EXIT"

  nix-shell -p 'ruby.withPackages (ps: with ps; [ github-pages webrick ])' --run \
    "jekyll serve -d $builddir --port 5000 --watch --force_polling --safe"
elif which docker > /dev/null; then
  IMAGE=starefossen/github-pages:latest
  CONTAINER_NAME=wreath

  exec docker run --rm -it --name "$CONTAINER_NAME" \
    -p 5000:5000 \
    -v "$PWD:/usr/src/app:ro" \
    -e JEKYLL_ENV=development \
    "$IMAGE" \
    jekyll serve \
      --host 0.0.0.0 --port 5000 -s /usr/src/app -d /tmp/_site \
      --watch --force_polling --safe
else
  echo "You need either docker (recommended) or nix installed"
  exit 1
fi

