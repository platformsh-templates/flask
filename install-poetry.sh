#!/usr/bin/env bash

# Install poetry.
export PIP_USER=false
echo "Downloading and installing poetry..."
curl -sSL https://install.python-poetry.org | python3 - --version $POETRY_VERSION
export PATH="/app/.local/bin:$PATH"
export PIP_USER=true
echo "Testing poetry..."
poetry --version

# Upgrade pip
echo "Upgrading pip..."
# python3.10 -m pip install --upgrade pip
poetry run python -m pip install --upgrade pip

# Check lockfile and environment.
echo "Setting poetry to use system..."
poetry env use system
echo "Running poetry check..."
poetry check
