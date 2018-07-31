# Dockerized Pilbox

see [https://github.com/agschwender/pilbox]

## Run

To run just start the container with optional arguments like this:

```
docker run --rm lovelysystems/docker-pilbox:dev
```

## Build and Release

See https://github.com/lovelysystems/lovely-gradle-plugin on how to build
and deploy the docker image.

## Pilbox Upstream Upgrade

Change the pilbox version in requirements.in and run pip-compile.

Edit `CHANGES.rst` and set the version to `<pilbox versin>00`.

If only this project changes but not the upstream version increase the
padded number at the end of the version
