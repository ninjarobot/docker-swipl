# SWI-Prolog Docker recipe

This repository is cloned from Michael Hendrick's
[mndrix/docker-swipl](https://github.com/mndrix/docker-swipl) and is
used to build the docker image
[swipl/swipl](https://hub.docker.com/r/swipl/swipl/).

This image is intended as a based image for SWI-Prolog derived servers.
It is based on the development releases.

To run it interactively, install docker and run

   docker run -it swipl/swipl:latest


## Further discussion

It is still rather unclear how SWI-Prolog with all its extensions and
configuration shall be dockerised. This
[wiki](https://github.com/SWI-Prolog/roadmap/wiki/Docker-images) is used
to discuss these issues, notably:

  - Define the proper stack of docker images
  - Establish best practices to use these
