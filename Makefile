include $(shell [ ! -f .mkdkr ] && curl -fsSL https://git.io/JOBYz > .mkdkr; bash .mkdkr init)

PROJECT=rosiney
REPOS=mkdkr_docker

self-include:
	@echo docker,https://github.com/rosineygp/mkdkr_docker.git,$(MKDKR_BRANCH_NAME) > mkdkr.csv

build:
	$(docker_build)

push:
	$(docker_push)