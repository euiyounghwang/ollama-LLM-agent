# Use a slim Python image for smaller footprint
FROM python:3.11.14-slim as environment
# FROM --platform=linux/amd64 python:3.11-slim as environment
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y curl ca-certificates

# Copy uv binary from the official Docker image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set uv configuration
ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy

WORKDIR /app

# Add this line BEFORE your requirements installation
# RUN pip install --no-cache-dir --upgrade pip setuptools wheel --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org

# Optimized caching: Install dependencies first
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project

# Copy application code and perform final sync
COPY . /app
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen

# Set PATH to use the virtual environment
ENV PATH="/app/.venv/bin:$PATH"


FROM python:3.11.14-slim as runtime
# FROM --platform=linux/amd64 python:3.11-slim as runtime

WORKDIR /app
#COPY --from=indexing_environment $POETRY_VENV $POETRY_VENV
COPY --from=environment /app .
COPY . FN-Basic-Ollama-Services

CMD ["python", "main.py"]

# ENTRYPOINT ["/app/FN-Basic-Services/docker-run-entrypoints.sh"]

# Use uv run to execute your production WSGI/ASGI application
# CMD ["uv", "run", "gunicorn", "--bind", "0.0.0.0:8000", "--workers", "4", "main:app"]