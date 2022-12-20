#!/bin/zsh

###### Description: Launch Houdini.
###### Author: Valentin Beaumont
###### Mail: valentin.onze@gmail.com

while true; do
    read -p "Do you wish to launch Houdini? [Y/n] " yn
    case $yn in
    [Yy]*)
        # ------ Source Houdini environment accorded to current OS
        _myos="$(uname)"
        case $_myos in
        Linux)
            houdini_dir="/opt/hfs19.5"
            ;;

        Darwin)
            houdini_dir="/Applications/Houdini/Current/Frameworks/Houdini.framework/Versions/19.5/Resources"
            ;;

        Windows)
            houdini_dir="C:\Program Files\Side Effects Software\Houdini 19.5.<houdini minor version>"
            ;;
        *) ;;
        esac

        cd $houdini_dir
        source ./houdini_setup
        echo ""

        # ------ Load environment variables
        echo "Loading environment variables..."
        echo "    • \033[0;34mPIPELINE_ROOT\033[0m: $PIPELINE_ROOT"
        echo "    • \033[0;34mHSITE\033[0m: $HSITE"
        echo ""

        # ------ Display package files being loaded
        echo "Loading package files..."
        package_dir="$PIPELINE_ROOT/houdini/houdini19.5/packages/"
        for file in "$package_dir"*; do
            echo "    • $(basename "$file")"
        done
        echo ""

        # ------ Start Houdini
        echo "Launching Houdini..."
        houdini
        echo "Closed Houdini launcher script: Houdini is running."
        break
        ;;
    [Nn]*)
        echo "Aborted by user."
        exit
        ;;
    *)
        echo "Please answer \033[1;32mY\033[0mes or \033[1;31mNo\033[0m"
        ;;
    esac
done
