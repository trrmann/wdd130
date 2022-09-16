#!/usr/bin/bash.exe
CALLED=$0
#echo $CALLED
NUM_ARGS=$#
if [[ $NUM_ARGS -ne 1 ]]; then
  #echo "Illegal number of arguments"
  #exit 2
  ARG="all"
else
  ARG=$1
fi
if [[ $ARG == "all" ]]; then
    #for ARG_SPEC in "wwr" "aboutMe" "practice" "personal"
    for ARG_SPEC in "wwr" "aboutMe" "practice"
    do
        deploy.sh $ARG_SPEC
    done
else
    PWD=`pwd`
    #echo $PWD
    if [[ $ARG == "practice" ]]; then
        SRC=/c/Users/Public/OneDrive/Documents/Projects/BYU-I/wdd130/practice
        DEST=/c/Users/Public/OneDrive/Documents/Projects/BYU-I/trrmann.github.io/wdd130/practice
    elif [[ $ARG == "wwr" ]]; then
        SRC=/c/Users/Public/OneDrive/Documents/Projects/BYU-I/wdd130/wwr
        DEST=/c/Users/Public/OneDrive/Documents/Projects/BYU-I/trrmann.github.io/wdd130/wwr
    elif [[ $ARG == "aboutMe" ]]; then
        SRC=/c/Users/Public/OneDrive/Documents/Projects/BYU-I/wdd130/aboutme
        DEST=/c/Users/Public/OneDrive/Documents/Projects/BYU-I/trrmann.github.io/wdd130/aboutme
    elif [[ $ARG == "personal" ]]; then
        SRC=/c/Users/Public/OneDrive/Documents/Projects/BYU-I/wdd130/wwr
        DEST=/c/Users/Public/OneDrive/Documents/Projects/BYU-I/trrmann.github.io/wdd130/wwr
    else
        echo "Warning: unknown package ${ARG}"
        exit 1
    fi
    rm -rf $DEST
    cp -r $SRC $DEST
    STATUS=`git status | grep "nothing to commit" | wc -l`
    if [[ ${STATUS} -eq 0 ]];
    then
      git add -a
      git commit -a -m "deployed"
      git push
      git pull
    fi
fi
exit 0