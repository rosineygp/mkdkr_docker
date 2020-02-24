REGISTRY=docker.io
PROJECT=$(shell echo $$USER)
REPOS=$(shell pwd | rev |cut -d'/' -f1 | rev)
DOCKER_ARGS=
DOCKER_BUILD_CONTEXT=.

define _docker_login =	
	if [ "$(DOCKER_USERNAME)" != "" ]; then \
		run: docker login -u $(DOCKER_USERNAME) -p '$(DOCKER_PASSWORD)' $(REGISTRY); \
	fi
endef

define _docker_tag =
	run: docker tag $(REGISTRY)/$(PROJECT)/$(REPOS):$(MKDKR_BRANCH_NAME_SLUG) \
		$(REGISTRY)/$(PROJECT)/$(REPOS):latest
endef

define docker_build =
	@$(dkr)
	dind:  docker:19
	run: docker build $(DOCKER_BUILD_ARGS) -t $(REGISTRY)/$(PROJECT)/$(REPOS):$(MKDKR_BRANCH_NAME_SLUG) $(DOCKER_BUILD_CONTEXT)
endef

define docker_push =
	@$(dkr)
	dind: docker:19
	$(_docker_login)
	run: docker push $(REGISTRY)/$(PROJECT)/$(REPOS):$(MKDKR_BRANCH_NAME_SLUG)
	if [ "$(MKDKR_BRANCH_NAME)" == "master" ]; then \
		$(_docker_tag); \
		run: docker push $(REGISTRY)/$(PROJECT)/$(REPOS):latest; \
	fi
endef

