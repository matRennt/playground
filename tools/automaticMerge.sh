#!/bin/sh
# Automatically merge the current story branch through the following branches:
# integration (-> master)

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
LAST_COMMIT=$(git rev-list -1 HEAD)

echo Automatically merging commit $LAST_COMMIT from $CURRENT_BRANCH to integration

case $CURRENT_BRANCH in
story.*)
  git checkout integration ＆＆ git merge $CURRENT_BRANCH
  git push
  ;;
esac
