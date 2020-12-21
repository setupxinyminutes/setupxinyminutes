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
