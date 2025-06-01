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



# Makefile (update)
test:
	poetry run pytest tests/

# .github/workflows/docker-build.yml (update)
      - name: Run tests
        run: poetry run pytest tests/