# Dockerized Pilbox

[![Docker Pulls](https://img.shields.io/docker/pulls/lovelysystems/docker-pilbox.svg)](https://hub.docker.com/r/lovelysystems/docker-pilbox/tags/)


This project provides a docker image for the awesome Pilbox image proxy. Which we use
in production to convert images on the fly. From the [Plibox project page](http://agschwender.github.io/pilbox/):
> Pilbox is an image processing application server built on Python’s Tornado web framework using the Python Imaging Library (Pillow). It is not intended to be the primary source of images, but instead acts as a proxy which requests images and resizes them as desired.

## Run as Service

The example below is a typical image proxy service definition in a
`docker-compose.yml` file for deployment under [Docker-Swarm](https://docs.docker.com/engine/swarm/)
 or just locally with [docker-dompose](https://docs.docker.com/compose/).

```yaml
  imageproxy:
    image: lovelysystems/docker-pilbox:1.3.300
    command:
      - "--client_key=somesharedsecret"
      - "--implicit_base_url=https://www.lovelysystems.com/"
    ports:
      - "8888:8888"
```

## Run as Container

To run just start the container with optional arguments like this:

```
docker run --rm lovelysystems/docker-pilbox:dev
```


## Developer Notes

### Build and Release

Take a look at the [Lovely Gradle Plugin project page](https://github.com/lovelysystems/lovely-gradle-plugin) on how to build
and deploy the docker image.

### Pilbox Upstream Upgrade

Change the Pilbox version in requirements.in and run pip-compile.

Edit `CHANGES.rst` and set the version to `<pilbox versin>00`.

If only this project changes but not the upstream version increase the
padded number at the end of the version
