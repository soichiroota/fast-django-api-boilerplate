build:
	docker-compose build

update:
	docker-compose run --rm app poetry update

install:
	docker-compose run --rm app poetry install

up:
	docker-compose up

up-build:
	docker-compose up --build

down:
	docker-compose down

test:
	make install
	docker-compose run --rm app pytest --cov=api tests

lint:
	make install
	docker-compose run --rm app flake8 tests
	docker-compose run --rm app isort --check --diff tests api
	docker-compose run --rm app black --check tests api
	docker-compose run --rm app mypy tests api

format:
	make install
	docker-compose run --rm app isort tests api
	docker-compose run --rm app black tests api
