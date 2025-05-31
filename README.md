# OpenAI Experiments

# README.md

## 🧪 OpenAI Experiments

Repositorio para ejecutar experimentos reproducibles con modelos de OpenAI, usando contenedores, FastAPI y Jupyter.

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

### ⚙️ Configuración del entorno

#### 1. Clona el repositorio y entra al directorio
```bash
git clone https://github.com/tu_usuario/openai-experiments.git
cd openai-experiments
```

#### 2. Crea tu archivo `.env`
Basado en `.env.example`, crea uno real con tu clave:

```bash
cp .env.example .env
```

Edita `.env` y reemplaza el valor con tu API key:
```
OPENAI_API_KEY=sk-...
```
> ⚠️ **No subas este archivo al repositorio.** Ya está incluido en `.gitignore`.

#### 3. Instala las dependencias
```bash
make install
```

---

### 🚀 Modos de ejecución

#### Ejecutar script principal:
```bash
make run
```

#### Usar Jupyter:
```bash
make jupyter
```

#### Levantar contenedor con Jupyter:
```bash
make dev
```

---

### 🌐 FastAPI

Si deseas exponer un endpoint:
```bash
poetry run uvicorn app.api:app --reload
```

Luego visita: http://localhost:8000/docs

---

### 🧪 GitHub Actions
Este repositorio incluye un flujo de CI que:
- Instala dependencias con Poetry
- Ejecuta `main.py` para validar conexión

El flujo se encuentra en `.github/workflows/docker-build.yml`

---

### 🧩 Pregunta frecuente

> ❓ ¿`app/api.py` debe estar dentro de una carpeta `app/`?

✅ **Sí.** `app` es un módulo Python que contiene el backend (`api.py`). Esto es útil para separar responsabilidades (backend, notebooks, scripts). Puedes ampliar esta estructura más adelante.

---

### 📬 Contacto
Autor: [Tu Nombre]
Licencia: MIT

