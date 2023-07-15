.PHONY: install lint selfcheck check build

install: ## Install dependencies
	poetry install

format: ## Run code formatter
	poetry run black .

lint: ## Run linter
	poetry run ruff check . 

selfcheck: ## Checks the validity of the pyproject.toml file
	poetry check

check: ## selfcheck + test + lint
	@make selfcheck
	@make format
	@make lint

build: ## Check and builds a package
	@make check
	@poetry build
