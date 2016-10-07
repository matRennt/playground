#!/bin/sh
# Automatically merge the current story branch through the following branches:
# integration (-> master)

_script=`basename $0`
_git="/opt/bitnami/git/bin/git"

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

#CURRENT_BRANCH=$($_git rev-parse --abbrev-ref HEAD)
CURRENT_BRANCH=$BRANCH
LAST_COMMIT=`$_git rev-list -1 HEAD`

echo "--- $_script: Automatically merging commit $LAST_COMMIT from $CURRENT_BRANCH to integration"

case $CURRENT_BRANCH in
story*)
  echo "--- $_script: merge $CURRENT_BRANCH"

  echo "--- $_script: prepare"

  which $_git

  echo "--- $_script: git --version"
  $_git --version
  echo "--- $_script: git config --list"
  $_git config --list
  echo "--- $_script: git status"
  $_git status

  # @@mat: needs to be changed after sw-management-build has the right permissions @github 
  #$_git config --global user.email "sw-managment-build@ortec.org"
  #$_git config --global user.name "sw-managment-build"
  $_git config --global user.email "griese@ortec.org"
  $_git config --global user.name "matRennt"

  gitURL_HTTPS=`$_git remote -v | nawk '{ print $2}' | head -1`
  gitURL=`echo $gitURL_HTTPS | sed "s|github.com/|github.com:|" | sed "s|https://|git@|"`
  echo "gitURL_HTTPS: ${gitURL_HTTPS}"
  echo "gitURL      : ${gitURL}"

  echo "--- $_script: git remote set-url origin ${gitURL}"
  $_git remote set-url origin ${gitURL}


  echo "--- $_script: run"


  echo "--- $_script: git checkout $CURRENT_BRANCH"
  $_git checkout $CURRENT_BRANCH || exit 1  

  echo "--- $_script: git branch -a"
  $_git branch -a || exit 1

  echo "--- $_script: git pull"
  $_git pull || exit 1  

  echo "--- $_script: git checkout integration"
  $_git checkout integration || exit 1

  echo "--- $_script: git pull"
  $_git pull || exit 1

  echo "--- $_script: git merge $CURRENT_BRANCH"
  $_git merge $CURRENT_BRANCH || exit 1

  echo "--- $_script: git push"
  $_git push || exit 1

  echo "--- $_script: fertig"

  ;;
esac
