#! /usr/bin/env bash

# update the static website on Github
# The assumption is that a branch called padames-pages exists in the current repo
# Also that we are in the project root of a Quarto website
# and that all the html pages required for the static website have been
# recently generated and live in the _site directory


if test $# -eq 0; then
    thisScriptName=$(basename "$0")
    echo "Usage: ${thisScriptName} COMMIT_MESSAGE"
    exit 0
fi

# the static website will be deployed from this branch
git switch padames-pages
# copy all html and other resources to the docs folder
cd docs/ && cp -r ../_site/* .

cd ../

git add .

git commit -m"$1"

./git-push.sh