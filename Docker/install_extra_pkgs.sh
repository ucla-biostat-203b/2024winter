#!/bin/bash
set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive

## build ARGs
NCPUS=${NCPUS:--1}

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

# install extra Ubuntu packages
apt_install \
    bsdmainutils \
    mlocate \
    tree

# install extra R packages
install2.r --error --skipmissing --skipinstalled -n "$NCPUS" \
    ggmap \
    ggrepel \
    htmlwidgets \
    JuliaCall \
    mapproj \
    quantmod \
    tidymodels

python3 -m pip --no-cache-dir install --upgrade --ignore-installed \
    cartopy \
    IPython \
    matplotlib \
    numpy \
    pandas \
    plotnine \
    seaborn 
    

# Clean up
rm -rf /var/lib/apt/lists/*
rm -r /tmp/downloaded_packages

## Strip binary installed lybraries from RSPM
## https://github.com/rocker-org/rocker-versioned2/issues/340
strip /usr/local/lib/R/site-library/*/libs/*.so