#!/bin/bash
#
# Simple SH wrapper to run Jekyll in Docker.

cd "$(dirname ${0})"

PROJECT_ROOT="$(pwd)"
JEKYLL_VERSION=4.0
JEKYLL_LPORT=4000
JEKYLL_ROOT="${PROJECT_ROOT}/jekyll"


function jekyll {
    docker run --rm -it \
    --volume="${JEKYLL_ROOT}:/srv/jekyll" \
    --volume="${JEKYLL_ROOT}/vendor/bundle:/usr/local/bundle" \
    --volume="${PROJECT_ROOT}/docs:/srv/jekyll/_site" \
    -p ${JEKYLL_LPORT}:4000 \
    -e "JEKYLL_ROOTLESS=true" \
    jekyll/jekyll:$JEKYLL_VERSION \
    jekyll $@
}


function init {
    jekyll new . $@
}

function build {
    jekyll build
}


case $1 in
    new|init) shift; init $@;;
    build) build;;
    jekyll) shift; jekyll $@;;
    *) echo "usage: $(basename ${0}) {init|build|serve|jekyll}"
esac
