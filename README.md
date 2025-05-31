# README.md

## 🧪 OpenAI Experiments

Repositorio para ejecutar experimentos reproducibles con modelos de OpenAI, usando contenedores, FastAPI y Jupyter.

---

### ⚠️ Nota importante sobre Poetry y lock file

Si modificas manualmente el archivo `pyproject.toml`, especialmente las secciones de dependencias o `packages`, **debes volver a generar el archivo `poetry.lock`** antes de ejecutar `make install`. Hazlo con:

```bash
poetry lock
```

Esto asegura que las versiones de dependencias estén alineadas.

---

### 📁 Estructura del Proyecto

```
openai-experiments/
├── .env.example         # Variables de entorno de ejemplo
├── .gitignore           # Evita subir .env, pycache, etc.
├── Dockerfile           # Imagen base para ejecución
├── Makefile             # Comandos automatizados
├── README.md            # Este documento
├── docker-compose.yml   # Levanta contenedor con Jupyter
├── pyproject.toml       # Proyecto gestionado con Poetry
├── poetry.lock          # Se genera tras instalar dependencias
├── main.py              # Script base que llama a OpenAI
├── notebooks/           # Experimentos interactivos
│   └── example_experiment.ipynb
├── app/                 # Código de FastAPI
│   └── api.py
├── scripts/             # Scripts reproducibles
│   └── example_script.py
└── .github/workflows/   # CI/CD con GitHub Actions
    └── docker-build.yml
```

---

(continúa con el contenido anterior del README si aplica...)
