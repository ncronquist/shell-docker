Shell-Docker
=============

This project builds a docker container with tools to test and validate shell
scripts for use in CI/CD environments.


Tools Available
----------------

The following tools are available in the docker container:

- [Shellcheck]
- [Shfmt]

[Shellcheck]: https://github.com/koalaman/shellcheck
[Shfmt]: https://github.com/mvdan/sh


Installation
-------------

You can pull the docker container from Docker Hub:

```
docker pull ncronquist/shell-docker:latest
```

More version tags can be found at
https://hub.docker.com/repository/docker/ncronquist/shell-docker


Builds
------

Each versioned directory in this repo will be built by Docker Hub and tagged
appropriately. Adding new versioned directories will require a maintainer to
update the build configuration in the Docker Hub UI.
