podman-setup:
	@echo "Instalando Podman y configurando podman-machine (solo macOS)..."
	brew install podman podman-compose || true
	podman system connection rm podman-machine-default || true
	podman system connection rm podman-machine-default-root || true
	podman machine init || true
	podman machine start

install:
	poetry install

run:
	poetry run uvicorn app.api:app --reload

test:
	poetry run pytest

jupyter:
	poetry run jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser

dev:
	docker-compose up --build

dev-podman:
	podman-compose up --build

build:
	docker build -t openai-experiments .

build-podman:
	podman build -t openai-experiments .

format:
	poetry run black .
