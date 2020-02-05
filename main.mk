REGISTRY=docker.io
PROJECT=$(shell echo $$USER)
REPOS=$(shell pwd | rev |cut -d'/' -f1 | rev)

define _docker_login =	
	if [ "$(DOCKER_USERNAME)" != "" ]; then \
		.. docker login -u $(DOCKER_USERNAME) -p '$(DOCKER_PASSWORD)' $(REGISTRY); \
	fi
endef

define _docker_tag =
	.. docker tag $(REGISTRY)/$(PROJECT)/$(REPOS):$(MKDKR_BRANCH_NAME_SLUG) \
		$(REGISTRY)/$(PROJECT)/$(REPOS):latest
endef

define _docker_push =
	.. docker push $(REGISTRY)/$(PROJECT)/$(REPOS):$(1)
endef

define docker_build =
	@$(.)
	... privileged docker:19
	.. docker build -t $(REGISTRY)/$(PROJECT)/$(REPOS):$(MKDKR_BRANCH_NAME_SLUG) .
endef

define docker_push =
	@$(.)
	... privileged docker:19
	$(_docker_login)
	.. docker push $(REGISTRY)/$(PROJECT)/$(REPOS):$(MKDKR_BRANCH_NAME_SLUG)
	if [ "$(MKDKR_BRANCH_NAME)" == "master" ]; then \
		$(_docker_tag); \
		.. docker push $(REGISTRY)/$(PROJECT)/$(REPOS):latest; \
	fi
endef

