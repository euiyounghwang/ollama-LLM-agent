set -e

# Activate virtualenv && run serivce
SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

VENV=".venv"
# VENV=".test_venv"

# Python 3.11.7 with Window
if [ -d "$VENV/bin" ]; then
    source $VENV/bin/activate
else
    source $VENV/Scripts/activate
fi

export PYTHONDONTWRITEBYTECODE=1

# py.test -v tests
# py.test -v ./tests --cov-report term-missing --cov
# poetry run py.test -sv ./tests --disable-warnings --cov-report term-missing --cov
uv run pytest ./tests -sv ./tests
# uv run pytest ./tests -sv ./tests -sv ./tests --disable-warnings --cov-report term-missing --cov