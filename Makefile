.PHONY: serve
serve:  ## Serve SXIYM in dev mode
	poetry run mkdocs serve


# Self-documenting makefile: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:  ## Show this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


################################################################################
# Dockerfiles
.PHONY: dpython
dpython:  ## Build container for python
	docker build --tag sxiym:python -f docs/python.Dockerfile . && docker run -it sxiym:python

.PHONY: dgo
dgo:  ## Build container for go
	docker build --tag sxiym:go -f docs/go.Dockerfile . && docker run -it sxiym:go

################################################################################
# PUBLISH
.PHONY: publish
publish:
	poetry shell && \
		cd ../setupxinyminutes.github.io && \
		mkdocs gh-deploy --config-file ../setupxinyminutes/mkdocs.yml --remote-branch master
