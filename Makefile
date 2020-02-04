include $(shell bash .mkdkr init)

PROJECT=rosiney
REPOS=mkdkr_docker

self-include:
	@echo docker,.,$(MKDKR_BRANCH_NAME) > mkdkr.csv

build:
	$(docker_build)

push:
	$(docker_push)