#!/bin/bash

ssh-keyscan github.com > /src/.ssh/known_hosts
echo "${INPUT_TARGET_DEPLOY_KEY}" > /src/.ssh/github
chmod --recursive 0700 /src/.ssh
chmod 0600 /src/.ssh/github

splitsh-lite --prefix="${INPUT_SOURCE_DIRECTORY}" --target=refs/heads/${INPUT_TARGET_REPOSITORY} --scratch

git remote add split github:${INPUT_TARGET_REPOSITORY}
git push -f -u split ${INPUT_TARGET_REPOSITORY}:${INPUT_TARGET_BRANCH}
git remote rm split
