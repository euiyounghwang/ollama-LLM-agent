# Use a slim Python image for smaller footprint and keep the Debian base patched.
FROM python:3.11.14-slim-bookworm AS environment
# FROM --platform=linux/amd64 python:3.11-slim as environment
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Copy uv binary from the official Docker image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set uv configuration
ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy

WORKDIR /app

# Add this line BEFORE your requirements installation
# RUN pip install --no-cache-dir --upgrade pip setuptools wheel --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org

# Optimized caching: Install dependencies first
# RUN --mount=type=cache,target=/root/.cache/uv \
#     --mount=type=bind,source=uv.lock,target=uv.lock \
#     --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
#     # uv sync --frozen --no-install-project
#     uv sync --no-install-project

# Copy application code and perform final sync
# COPY . /app
# RUN --mount=type=cache,target=/root/.cache/uv \
#     # uv sync --frozen
#     uv sync --all-extras --dev

# Set PATH to use the virtual environment
# ENV PATH="/app/.venv/bin:$PATH"

# Enable bytecode compilation and unbuffered output for Python
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install project dependencies first (this layer caches aggressively)
COPY pyproject.toml uv.lock ./
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --no-dev --no-install-project --locked

# Copy the rest of the source code and install the project itself
COPY . /app
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --all-extras --dev


FROM python:3.11.14-slim AS runtime
# FROM --platform=linux/amd64 python:3.11-slim as runtime

WORKDIR /app
#COPY --from=indexing_environment $POETRY_VENV $POETRY_VENV
COPY --from=environment /app .
COPY . FN-Basic-Ollama-Services

# Ensure the virtual environment's executables are on the PATH
ENV PATH="/app/.venv/bin:$PATH"

CMD ["python", "main.py"]

# ENTRYPOINT ["/app/FN-Basic-Ollama-Services/docker-run-entrypoints.sh"]

# Use uv run to execute your production WSGI/ASGI application
# CMD ["uv", "run", "gunicorn", "--bind", "0.0.0.0:8000", "--workers", "4", "main:app"]

FROM python:3.11.14-slim AS test

WORKDIR /app
#COPY --from=indexing_environment $POETRY_VENV $POETRY_VENV
COPY --from=environment /app .
COPY . FN-Basic-Ollama-Services

# Ensure the virtual environment's executables are on the PATH
ENV PATH="/app/.venv/bin:$PATH"

ENTRYPOINT ["/app/FN-Basic-Ollama-Services/docker-run-tests.sh"]