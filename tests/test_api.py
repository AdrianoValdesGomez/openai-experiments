import os
import pytest
from fastapi.testclient import TestClient
from app.api import app
from dotenv import load_dotenv

load_dotenv()
client = TestClient(app)

def test_chat_endpoint():
    response = client.post("/chat", json={"message": "Hola"})
    assert response.status_code == 200
    assert "response" in response.json()
    assert isinstance(response.json()["response"], str)

# pyproject.toml (update)
[tool.poetry.dependencies]
python = "^3.11"
openai = "^1.0.0"
python-dotenv = "^1.0.0"
fastapi = "^0.111.0"
uvicorn = "^0.30.0"
jupyter = "^1.0.0"

[tool.poetry.group.dev.dependencies]
pytest = "^8.1.1"
httpx = "^0.27.0"

# Makefile (update)
test:
	poetry run pytest tests/

# .github/workflows/docker-build.yml (update)
      - name: Run tests
        run: poetry run pytest tests/