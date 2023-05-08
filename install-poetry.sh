#!/usr/bin/env bash

# Install poetry.
export PIP_USER=false
curl -sSL https://install.python-poetry.org | python3 - --version $POETRY_VERSION
export PATH="/app/.local/bin:$PATH"
export PIP_USER=true

# Upgrade pip
# python3.10 -m pip install --upgrade pip
poetry run python -m pip install --upgrade pip

# Check lockfile and environment.
poetry env use system
poetry check
