# ollama-LLM-agent
<i>>ollama-LLM-agent

### Docker
- docker system prune -a --volumes

### Ollama
- Ollama lets you use open models with your coding agents so you can spend less while keeping your data private.
- Port 11434 is the default network port used by the Ollama API to run local large language models (http://localhost:11434)
- Github Download : https://github.com/ollama/ollama/releases
- Reference : https://goddaehee.tistory.com/381
- Ollama Model Path : C:\Users\<사용자명>\.ollama\models (blobs/manifests all copy to the remote server)
- __Installation__
```bash

# Installation using sh
curl -fsSL https://ollama.com/install.sh | sh

ollama list
NAME               ID              SIZE      MODIFIED
llama3.2:latest    a80c4f17acd5    2.0 GB    5 days ago

ollama run llama3.2

# Manual Installation using tar file
- RHEL7 Tar.gz : https://github.com/ollama/ollama/releases?expanded=true&page=2&q=0.5#release-v0.5.0

# --
# Windows (PowerShell)
#$env:OLLAMA_HOST="0.0.0.0:11434"  # 네트워크 접근 허용
#$env:OLLAMA_MODELS="C:\work\ollamaModel"  # 모델 저장 위치 변경

# Linux/Mac
export OLLAMA_HOST=0.0.0.0:11434
export OLLAMA_MODELS=/apps/model/ollama/download_model

./bin/ollama serve or ./ollama-linux-start.sh

# -- Test
curl http://localhost:11434
# --

# Installation OpenWebUI
# Create virtual env
python3.11 -m venv .venv
source .venv/bin/activate

uv add open-webui
uv add --dev pytest pytest-cov --system-certs

```
- __Manually install Open-WebUI using Offline Installation__
  - __pip freeze > ./dev_openwebui_requirements.txt__
  - __mkdir lib__
  - __cd lib__
  - __pip download -r ../dev_openwebui_requirements.txt -d ./__
  - __pip install -r ./dev_openwebui_requirements.txt --no-index --find-links="/apps/model/open_web_ui/test/test"__
  ```bash
  accelerate-1.13.0-py3-none-any.whl                    narwhals-2.25.0-py3-none-any.whl
  aiocache-0.12.3-py2.py3-none-any.whl                  networkx-3.6.1-py3-none-any.whl
  ```  
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
- ollama run llama3
- open-webui serve --port 3000

### MCP server
- Python3.11 (python3.11 -m venv .mcp_agent)
- pip install fastmcp mcpo
- Run : source .mcp_agent/bin/activate
- __Commands__
```bash
uv add fastmcp mcpo in .venv (source .venv/bin/activate)

mcpo --host 0.0.0.0 --port 8000 -- fastmcp run mcp_server.py:mcp
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

### Dify
- Dify is an open-source platform designed to help people build and run applications powered by large language models (LLMs).
- __Commands__
  - git clone https://github.com/langgenius/dify.git
  - cd dify/docker
  - cp .env.example .env
  - docker compose up -d
- __Run__ ; 주소창에 http://localhost/install (또는 포트 설정에 따라 http://localhost:3000/install)을 입력합니다, http://localhost/apps


### Create Virtural Env via uv
- __Commands__
  - uv export -o ./dev_uv_requirements.txt
  - uv pip install -r ./dev_uv_requirements.txt
  - uv sync # pyproject.toml 과 uv.lock 파일을 기준으로 가상환경 재생성 및 동기화
  - uv sync --dev --active
  - uv sync --all-extras --dev # Ensures pytest is available


### Pytest via uv
- uv run pytest ./tests
- uv run pytest ./tests/test_api.py
- ./pytest.sh
```bash
$ ./pytest.sh
======================================================================= test session starts =======================================================================
platform win32 -- Python 3.11.14, pytest-9.1.1, pluggy-1.6.0 -- C:\Users\euiyoung.hwang\Git_Workspace\ollama-LLM-agent\.venv\Scripts\python.exe
cachedir: .pytest_cache
rootdir: C:\Users\euiyoung.hwang\Git_Workspace\ollama-LLM-agent\tests
configfile: pytest.ini
plugins: anyio-4.15.1, langsmith-0.12.2, cov-7.1.0
collected 1 item                                                                                                                                                   

tests\test_api.py::test_api PASSED

======================================================================== 1 passed in 0.03s ========================================================================
(.venv) 
```
