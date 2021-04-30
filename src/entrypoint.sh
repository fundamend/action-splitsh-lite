#!/bin/bash

ssh-keyscan github.com > /src/.ssh/known_hosts
echo "${INPUT_TARGET_DEPLOY_KEY}" > /src/.ssh/github
chmod 0600 /src/.ssh/github

splitsh-lite --prefix="${INPUT_SOURCE_DIRECTORY}" --target=refs/heads/${INPUT_SPLIT} --scratch

git remote add split github:${INPUT_SPLIT}
git push -f -u split ${INPUT_SPLIT}:${INPUT_TARGET_BRANCH}
git remote rm split
