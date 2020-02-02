REGISTRY=docker.io
PROJECT=$(shell echo $$USER)
REPOS=$(shell pwd | rev |cut -d'/' -f1 | rev)
TAG=latest

define docker_build =
	@$(.)
	... privileged docker:19
	.. docker build -t $(REGISTRY)/$(PROJECT)/$(REPOS):$(TAG) .
endef
