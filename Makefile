.PHONY: install test run_test fix format lint selfcheck check build
POETRY = $(POETRY_HOME)/venv/bin/poetry

install: ## Install dependencies
	$(POETRY) install

test: ## Run tests in docker
	docker build -t redis_from_scratch_python:latest --target test .

run_test: ## Run tests with poetry
	$(POETRY) run pytest tests

fix: ## Fix linter warnings
	@make format
	$(POETRY) run ruff check --fix .

format: ## Run code formatter
	$(POETRY) run black .

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
