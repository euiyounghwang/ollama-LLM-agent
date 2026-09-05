# ollama-LLM-agent
ollama-LLM-agent

FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.8+ based on standard Python.

UV is an extremely fast Python package and project manager, written in Rust. UV manages project dependencies and environments, with support for lockfiles, workspaces, and more.
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
```
- __Commands__
```bash
oopen-webui serve --port 3000

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