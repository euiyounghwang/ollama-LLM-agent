# ollama-LLM-agent
ollama-LLM-agent


### Ollama
- Ollama lets you use open models with your coding agents so you can spend less while keeping your data private.
- Port 11434 is the default network port used by the Ollama API to run local large language models (http://localhost:11434)
- __Commands__
```bash

# ollama model check
ollama list
NAME                ID              SIZE      MODIFIED
qwen2.5-coder:7b    dae161e27b0e    4.7 GB    12 minutes ago
llama3:latest       365c0bd3c000    4.7 GB    3 months ago

# You can test your local Ollama server on port 11434 by sending a basic GET request to http://localhost:11434 or a POST request to http://localhost:11434/api/generate
curl -X POST http://localhost:11434/api/generate -d '{
  "model": "llama3",
  "prompt": "Why is the sky blue?",
  "stream": false
}'
```
- open-webui serve --port 3000

### MCP server
- Python3.11 (python3.11 -m venv .mcp_agent)
- pip install fastmcp mcpo
- Run : source .mcp_agent/bin/activate
- __Commands__
```bash
mcpo --port 8000 -- fastmcp run mcp_server.py:mcp
uv run mcpo --port 8000 -- python mcp_server.py

# Endpoint
http://localhost:8000/docs
```



### FastAPI with Uv
- FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.8+ based on standard Python.
- UV is an extremely fast Python package and project manager, written in Rust. UV manages project dependencies and environments, with support for lockfiles, workspaces, and more.
- A single tool to replace pip, pip-tools, pipx, poetry, pyenv, twine, virtualenv, and more
- 10-100x faster than pip.
- Installs and manages Python versions.


### Using Uv: Create the virtual environment in the same directory as the project and install the dependencies:
- uv installation : https://www.0x00.kr/development/python/python-uv-simple-usage-and-example
```bash
# On macOS and Linux.
curl -LsSf https://astral.sh/uv/install.sh | sh

# On Windows.
powershell -c "irm https://astral.sh/uv/install.ps1 | iex"

# With pip.
pip install uv

# With pipx.
pipx install uv

# With Homebrew.
brew install uv

# With Pacman.
pacman -S uv
```

- uv venv
```bash
#uv venv --python 3.11.0
#uv python list

python3.11 -m venv .venv
source .venv/bin/activate

uv add open-webui

# uv sync
# uv sync시 오류발생 -> rm -rf uv.lock, 
uv sync --no-cache
```
- __Commands__
```bash
open-webui serve --port 3000

 - defaulting to ffmpeg, but may not work
  warn("Couldn't find ffmpeg or avconv - defaulting to ffmpeg, but may not work", RuntimeWarning)

 ██████╗ ██████╗ ███████╗███╗   ██╗    ██╗    ██╗███████╗██████╗ ██╗   ██╗██╗
██╔═══██╗██╔══██╗██╔════╝████╗  ██║    ██║    ██║██╔════╝██╔══██╗██║   ██║██║
██║   ██║██████╔╝█████╗  ██╔██╗ ██║    ██║ █╗ ██║█████╗  ██████╔╝██║   ██║██║
██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║    ██║███╗██║██╔══╝  ██╔══██╗██║   ██║██║
╚██████╔╝██║     ███████╗██║ ╚████║    ╚███╔███╔╝███████╗██████╔╝╚██████╔╝██║
 ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝     ╚══╝╚══╝ ╚══════╝╚═════╝  ╚═════╝ ╚═╝


v0.11.3 - building the best AI user interface.

https://github.com/open-webui/open-webui

INFO:     Started server process [12990]
..
```