TAG=latest

define docker_build =
	@$(.)
	... privileged docker:19
	.. docker build -t $(REGISTRY)/$(PROJECT)/$(REPOS):$(TAG) .
endef
