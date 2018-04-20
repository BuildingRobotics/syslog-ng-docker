#!/bin/bash
set -e

# Don't tag PR builds at all
if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    # Tag with current git commit
    printf -- "-t $1:${TRAVIS_COMMIT} "
    # Tag with version number
    printf -- "-t $1:$2 "
    # If master, tag with 'latest'
    if [ "${TRAVIS_BRANCH}" = "master" ]; then
        printf -- "-t $1:latest "
    fi
fi
