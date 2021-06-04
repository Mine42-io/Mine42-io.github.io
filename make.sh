#!/bin/bash
#
# Simple SH wrapper to run Jekyll in Docker.

cd "$(dirname ${0})"

PROJECT_ROOT="$(pwd)"
JEKYLL_VERSION=4.0
JEKYLL_LPORT=4000
JEKYLL_ROOT="${PROJECT_ROOT}/jekyll"


# Run the Jekyll image.
# $1: command name ('jekyll', 'bundle', etc.)
# $@: command arguments
function run() {
    docker run --rm -it \
    --volume="${JEKYLL_ROOT}:/srv/jekyll" \
    --volume="${JEKYLL_ROOT}/vendor/bundle:/usr/local/bundle" \
    --volume="${PROJECT_ROOT}/docs:/srv/jekyll/_site" \
    -p ${JEKYLL_LPORT}:4000 \
    -e "JEKYLL_ROOTLESS=true" \
    jekyll/jekyll:$JEKYLL_VERSION \
    "${1}" ${@:2}
}


function init() {
    run jekyll new . --force
}


function update() {
    run bundle update
}


function build() {
    run jekyll build
}


function serve() {
    run jekyll serve
}


case $1 in
    new|init) shift; init $@;;
    build) build;;
    serve) serve;;
    run) shift; run $@;;
    *) echo "usage: $(basename ${0}) {new|init|build|serve|run}"
esac
