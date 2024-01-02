#!/bin/bash
set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive

# install extra Python packages
export VIRTUAL_ENV="${VIRTUAL_ENV:=/opt/venv}"
export PATH="${VIRTUAL_ENV}/bin:${PATH}"
python3 -m venv "${VIRTUAL_ENV}"
python3 -m pip install --no-cache-dir -r /rocker_scripts/python_pkgs.txt
# Make the venv owned by the staff group, so users can install packages
# without having to be root
fix-permissions "${VIRTUAL_ENV}"

