.PHONY: run_docker install lint selfcheck check build
POETRY = $(POETRY_HOME)/venv/bin/poetry 

build_docker: ## Build docker image with name redis_from_scratch_python
	docker build -t redis_from_scratch_python:latest .

run_docker: ## Run docker image with name redis_from_scratch_python
	docker run redis_from_scratch_python

install: ## Install dependencies
	$(POETRY) install

format: ## Run code formatter
	$(POETRY) run black .

fix: ## Fix linter warnings
	@make format
	$(POETRY) run ruff check --fix .

lint: ## Run linter
	$(POETRY) run ruff check . 

selfcheck: ## Checks the validity of the pyproject.toml file
	$(POETRY) check

check: ## selfcheck + test + lint
	@make selfcheck
	@make format
	@make lint

build: ## Check and builds a package
	@make check
	@poetry build
