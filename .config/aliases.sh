#!/bin/zsh

###### Description: Define aliases to use in shell.
###### Author: Valentin Beaumont
###### Mail: valentin.onze@gmail.com

# ------ Shell
alias c="clear"
alias h="history"
alias j="jobs -l"

# ------ Add alias as per OS using $_myos
_myos="$(uname)"
case $_myos in
Linux) ###### LINUX ############################################################
    alias current_os="echo 'linux'"

    # ------ DCCs and VFX
    alias {houdini, hou, h}='cd $ENVIRONMENT_ROOT/unix && sh ./houdini.sh'
    ;;

Darwin) ###### MACOS ###########################################################
    alias current_os="echo 'macOS'"

    # ------ DCCs and VFX
    alias {houdini, hou, h}='cd $ENVIRONMENT_ROOT/unix && sh ./houdini.sh'
    ;;

Windows) ###### WINDOWS ########################################################
    alias current_os="echo 'windows'"
    ;;
*) ;;
esac
