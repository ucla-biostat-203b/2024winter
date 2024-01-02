#!/bin/bash
set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive

# install extra Julia packages
julia -e 'using Pkg; Pkg.add(readlines("/rocker_scripts/julia_pkgs.txt"))'
# Make the venv owned by the staff group, so users can install packages
# without having to be root
fix-permissions "${JULIA_DEPOT_PATH}"
