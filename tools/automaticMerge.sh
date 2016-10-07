#!/bin/sh
# Automatically merge the current story branch through the following branches:
# integration (-> master)

_script=`basename $0`

usage() {
    echo "Automatically merge the current story branch into integration"
    echo ""
    echo "`basename $0`"
    echo "\t-h --help"
    echo "\t--branch=$BRANCH"
    echo ""
}

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --branch)
            BRANCH=$VALUE
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

#CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
CURRENT_BRANCH=$BRANCH
LAST_COMMIT=$(git rev-list -1 HEAD)

echo Automatically merging commit $LAST_COMMIT from $CURRENT_BRANCH to integration

case $CURRENT_BRANCH in
story*)
  echo "--- $_script: ################################################"
  echo "--- $_script: # merge $CURRENT_BRANCH"
  echo "--- $_script: #"

  echo "--- $_script: prepare"

  which git
  git --version
  git config --list
  git status

  #git config --global user.email "sw-managment-build@ortec.org"
  #git config --global user.name "sw-managment-build"
  git config --global user.email "griese@ortec.org"
  git config --global user.name "matRennt"

  gitURL_HTTPS=`git remote -v | nawk '{ print $2}' | head -1`
  gitURL=`echo $gitURL_HTTPS | sed "s|github.com/|github.com:|" | sed "s|https://|git@|"`
  echo "gitURL_HTTPS: ${gitURL_HTTPS}"
  echo "gitURL      : ${gitURL}"

  echo "--- $_script: git remote set-url origin ${gitURL}"
  git remote set-url origin ${gitURL}


  echo "--- $_script: run"
  git checkout integration || exit 1
  git pull || exit 1
  git merge $CURRENT_BRANCH || exit 1
  git push
  echo "--- $_script: fertig"

  ;;
esac
