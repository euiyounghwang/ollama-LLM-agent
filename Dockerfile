# Use a slim Python image for smaller footprint
FROM python:3.12-slim

# Copy uv binary from the official Docker image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Set uv configuration
ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy

WORKDIR /app

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

CMD ["python", "main.py"]

# Use uv run to execute your production WSGI/ASGI application
# CMD ["uv", "run", "gunicorn", "--bind", "0.0.0.0:8000", "--workers", "4", "main:app"]