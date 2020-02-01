TAG:latest

define docker_build =
	$(.)
	... privileged docker:19
	.. docker built -t $(REGISTRY)/$(PROJECT)/$(REPOS):$(TAG) .
endef