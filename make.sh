#!/bin/bash
#
# Simple SH wrapper to run Jekyll in Docker.

# Jekyll configuration
JEKYLL_VERSION=4.0
JEKYLL_LPORT=4000
JEKYLL_ROOT="jekyll"


function jekyll {
    docker run --rm -it \
    --volume="${PWD}:/srv/jekyll" \
    --volume="${PWD}/vendor/bundle:/usr/local/bundle" \
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


cd "$(dirname ${0})/${JEKYLL_ROOT}"
case $1 in
    new|init) shift; init $@;;
    build) build;;
    jekyll) shift; jekyll $@;;
    *) echo "usage: $(basename ${0}) {init|build|serve|jekyll}"
esac
