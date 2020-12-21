run:
	poetry run mkdocs serve

python:
	docker build --tag sxiym:python -f docs/python.Dockerfile . && docker run -it sxiym:python
