# mkdkr docker

Docker helper for mkdkr.

## build

Build `Dockerfile`.

```Makefile
docker:
  $(docker_build)
```
## push

Push to a remote registry a docker image.

```Makefile
push:
  $(docker_push)
```

## variables

|Name|Default|Description|
|----|-------|-----------|
|DOCKER_USERNAME|unset|If unset, skips login and try push anonymously|
|DOCKER_PASSWORD|unset|DOCKER_USERNAME password|
|REGISTRY|docker.io|Docker registry|
|PROJECT|$USER|hub.docker image organization|
|REPOS|current folder|hub.docker image repository|
|DOCKER_BUILD_ARGS|""|Any docker build arguments|
|DOCKER_BUILD_CONTEXT|.|Context folder|

> \* Use MKDKR_BRANCH_NAME_SLUG for branch based tags

> \*\* When branch is master, it will pushes as latest too.