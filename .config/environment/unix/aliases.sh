#!/bin/zsh

###### Description: Define aliases to use in shell.
###### Author: Valentin Beaumont
###### Mail: valentin.onze@gmail.com

# ------ Shell
alias c="clear"
alias h="history"
alias j="jobs -l"

# ------ DCCs and VFX
alias {houdini,hou}='cd $ENVIRONMENT_ROOT/unix && sh ./houdini.sh'
# alias {nuke,nk}='cd $ENVIRONMENT_ROOT/unix && sh ./nuke.sh'
# alias {maya,ma}='cd $ENVIRONMENT_ROOT/unix && sh ./maya.sh'
# alias {substance_painter,sp}='cd $ENVIRONMENT_ROOT/unix && sh ./substance_painter.sh'

# ------ Add alias as per OS using $_myos
_myos="$(uname)"
case $_myos in
Linux) ###### LINUX ############################################################
    alias current_os="echo 'linux'"
    ;;

Darwin) ###### MACOS ###########################################################
    alias current_os="echo 'macOS'"
    ;;

Windows) ###### WINDOWS ########################################################
    alias current_os="echo 'windows'"
    ;;
*) ;;
esac
