#!/usr/bin/env bash

# Upgrade pip
echo "Upgrading pip..."
python3.10 -m pip install --upgrade pip

# Install poetry.
export PIP_USER=false
echo "Downloading and installing poetry..."
curl -sSL https://install.python-poetry.org | python3 - --version $POETRY_VERSION
export PATH="/app/.local/bin:$PATH"
export PIP_USER=true
echo "Testing poetry..."
poetry --version

# Upgrade pip
echo "Upgrading pip within poetry..."
poetry run python -m pip install --upgrade pip

echo "Do we have any envs?"
poetry env list

# Check lockfile and environment.
echo "Setting poetry to use system..."
poetry env use 3.10
echo "Running poetry check..."
poetry check
echo "Poetry config list:"
poetry config --list
