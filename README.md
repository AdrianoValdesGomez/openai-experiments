# 🤖 OpenAI Experiments

Repositorio para realizar experimentos reproducibles con modelos de OpenAI, integrando FastAPI, Jupyter Notebooks y contenedores Docker/Podman.

---

## 🧰 Requisitos

### Para macOS (con Docker o Podman):

- **Python 3.11+**
- **[Poetry](https://python-poetry.org/docs/#installation)**
- **[Docker Desktop](https://docs.docker.com/desktop/install/mac/)** (requiere Rosetta si usas M1/M2)
  - o **[Podman](https://podman.io/)**:
    ```bash
    brew install podman podman-compose
    podman machine init
    podman machine start
    ```
- Clave de API de OpenAI (almacenada en `.env`)

---

## 📦 Características del entorno

- Entorno aislado con [Poetry](https://python-poetry.org/)
- Contenedor reproducible con Docker o Podman
- Servidor FastAPI (`app/api.py`)
- Notebooks Jupyter para experimentación interactiva
- Tests automatizados con `pytest`
- Variables de entorno seguras vía `.env`
- CI/CD básico con GitHub Actions

---

## 🚀 Comandos disponibles

```bash
make podman-setup    # Instala Podman y configura podman-machine (solo macOS)
```

```bash
make podman-setup    # Instala y configura Podman para macOS (brew + podman machine)
make install         # Instala dependencias y configura entorno
make run             # Ejecuta la API local con uvicorn
make test            # Ejecuta los tests
make jupyter         # Lanza Jupyter Notebook
make dev             # Lanza el contenedor Docker para desarrollo
make dev-podman      # Lanza el contenedor con Podman
make build           # Construye imagen Docker
make build-podman    # Construye imagen Podman
make format          # Formatea código con black

### 🎯 Alternativas con Podman (dentro del contenedor):
Si deseas que `podman`, `podman-compose` y `poetry` estén **dentro del contenedor**, modifica tu `Dockerfile` para instalar estas herramientas allí también (no en tu sistema anfitrión). Se recomienda esto solo si vas a usar el contenedor como entorno de desarrollo principal.

Ejemplo (en Dockerfile):
```Dockerfile
# Instala Poetry y Podman tools dentro del contenedor
RUN pip install poetry podman-compose podman

# (Opcional) Instalar podman desde el sistema si se desea acceso completo\ 
# RUN apt-get update && apt-get install -y podman
```
Luego podrás ejecutar comandos desde una terminal dentro del contenedor como:
```bash
podman-compose up
poetry run jupyter notebook
```

---

## 🐳 Ejecutar en un contenedor Docker o Podman

> **Nota:** No es necesario iniciar sesión en Docker Desktop para ejecutar contenedores localmente. Basta con que Docker esté abierto y corriendo ("Docker is running"). Solo necesitarás iniciar sesión si deseas subir imágenes al Docker Hub o usar servicios en la nube.

> ⚠️ **Importante:** Si ya tienes Jupyter Notebook corriendo localmente en el puerto `8888`, el contenedor no podrá exponer el mismo puerto y podría mostrarte tus archivos locales en lugar de los del contenedor. En ese caso:
> - Cierra cualquier instancia de Jupyter que tengas abierta localmente.
> - O modifica el archivo `docker-compose.yml` para usar otro puerto (por ejemplo, `8889:8888`).

### 1. Crear el archivo `.env` con tu clave de API:
```bash
cp .env.example .env
```

### 2. Construir la imagen del contenedor:

Con Docker:
```bash
make build
```

Con Podman:
```bash
make build-podman
```

### 3. Iniciar el contenedor y abrir Jupyter:

Con Docker Compose:
```bash
make dev
```

Con Podman:
```bash
make dev-podman
```

Si estás usando otro puerto (por ejemplo, `8889:8888`), abre Jupyter en:
```
http://localhost:8889
```

### ✅ Recomendación para Podman + Lima (macOS):
Si estás usando Podman en macOS, asegúrate de instalar [Lima](https://github.com/lima-vm/lima) y correr:
```bash
podman machine init
podman machine start
```
Antes de construir o ejecutar el contenedor.

---

## 🧰 Configuración previa para usar Podman en macOS

Antes de poder ejecutar `make dev-podman` o `make build-podman`, asegúrate de tener instalado lo siguiente **en tu sistema anfitrión (fuera del contenedor):**

1. **Instalar Podman y Podman Compose:**
   ```bash
   brew install podman podman-compose
   ```

2. **Inicializar y arrancar la máquina virtual de Podman (Lima):**
   ```bash
   podman machine init
   podman machine start
   ```

3. (Opcional) Verificar instalación:
   ```bash
   podman info
   podman-compose version
   ```

> 🔒 Esto sólo se hace una vez en tu entorno local. A partir de ahí, puedes usar todos los comandos `make dev-podman`, `make build-podman`, etc.

---

## 📁 Estructura del Proyecto

```
openai-experiments/
├── .env.example           # Variables de entorno de ejemplo
├── Makefile               # Comandos automatizados
├── Dockerfile             # Imagen Docker
├── docker-compose.yml     # Orquestación con Jupyter
├── pyproject.toml         # Configuración de Poetry
├── poetry.lock            # Versión bloqueada de dependencias
├── README.md              # Este archivo
├── main.py                # Script base de pruebas
├── app/                   # API FastAPI
│   └── api.py
├── scripts/               # Scripts para pruebas/automatización
├── notebooks/             # Notebooks Jupyter
│   └── example_experiment.ipynb
├── tests/                 # Pruebas automatizadas
│   └── test_api.py
└── .github/workflows/     # CI/CD en GitHub
    └── docker-build.yml
```

---

## 🔐 Variables de entorno

Copia el archivo `.env.example` a `.env` y añade tu clave de API de OpenAI:

```bash
cp .env.example .env
```

Contenido típico:

```env
OPENAI_API_KEY=sk-...
```

**Nunca subas tu archivo `.env` al repositorio.**

---

## ⚠️ ¿Cambiaste `pyproject.toml`?

Si hiciste modificaciones manuales en dependencias o estructura del proyecto, debes actualizar el lockfile:

```bash
poetry lock
make install
```

---

## 🐋 ¿Estoy ejecutando el entorno en Docker?

Para verificar si estás dentro de un contenedor Docker, ejecuta esta celda dentro de un notebook:

```python
!cat /etc/os-release
```

- Si ves algo como `Debian`, `Ubuntu` o `Alpine` → estás en Docker.
- Si ves `macOS`, `arch`, etc. → estás fuera de Docker.

---

## 📓 ¿Dónde empiezo?

Abre el siguiente notebook para comenzar:

```bash
make jupyter
```

Y edita:

```
notebooks/example_experiment.ipynb
```

---

## 🧪 Próximos pasos (opcional)

- Añadir módulos de embeddings o imágenes
- Implementar almacenamiento local de resultados
- Generar dashboards automáticos

---

## 🧠 Créditos

Este entorno fue configurado para facilitar la exploración reproducible y segura de los modelos de OpenAI.
