install:
	poetry install

run:
	poetry run python main.py

dev:
	docker-compose up --build

jupyter:
	poetry run jupyter notebook notebooks/

test:
	poetry run pytest tests/

# .github/workflows/docker-build.yml (update)
      - name: Run tests
        run: poetry run pytest tests/

build:
	docker build -t openai-experiments .

build-podman:
	podman build -t openai-experiments .
