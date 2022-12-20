#!/bin/zsh

###### Description: 
###### Author: Valentin Beaumont
###### Mail: valentin.onze@gmail.com

###### ENVIRONMENT #############################################################

# ------ Cloud (used as a server equivalent)
_myos="$(uname)"
case $_myos in
Linux)
    export SERVER_ROOT="Path/to/drive/linux"
    ;;

Darwin)
    export SERVER_ROOT="Path/to/drive/macOS"
    ;;

Windows)
    export SERVER_ROOT="Path/to/drive/windows"
    ;;
*) ;;
esac

export CONFIG_ROOT="$SERVER_ROOT/.config"
export ENVIRONMENT_ROOT="$CONFIG_ROOT/environment"
export PIPELINE_ROOT="$CONFIG_ROOT/pipeline"

# ------ Shell
if [ -f $ENVIRONMENT_ROOT/unix/aliases.sh ]; then
    . $ENVIRONMENT_ROOT/unix/aliases.sh
fi

if [ -f $ENVIRONMENT_ROOT/unix/dcc.sh ]; then
    . $ENVIRONMENT_ROOT/unix/dcc.sh
fi
