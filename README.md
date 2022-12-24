<p align="left">
  <a href="https://www.python.org">
  <img src="https://img.shields.io/badge/-Python-FFD43B?style=for-the-badge&logo=python" alt="Python"/></a> 
  <a href="https://www.qt.io/qt-for-python">
  <img src="https://img.shields.io/badge/-Shell-313131?style=for-the-badge&logo=powershell" alt="Shell"/></a>
  <img src="https://img.shields.io/badge/-Batch-313131?style=for-the-badge&logo=powershell" alt="Batchfile"/></a>
  <img src="https://img.shields.io/badge/-Windows-00A4EF?style=for-the-badge&logo=windows" alt="Compatible with Windows"/></a>
  <img src="https://img.shields.io/badge/-macOS-000000?style=for-the-badge&logo=apple" alt="Compatible with macOS"/></a>
  <img src="https://img.shields.io/badge/-Linux-E95420?style=for-the-badge&logo=linux" alt="Compatible with Linux"/></a> 
</p>

<div id="top"></div>
<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/healkeiser/cloud_vfx_server">
    <img src="https://cdn-icons-png.flaticon.com/512/2345/2345350.png" alt="Logo" width="80" >
  </a>

  <h3 align="center">Cloud VFX Server</h3>

  <p align="center">
    VFX Pipeline
    <br />
    <br />
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
## Table of Contents
<!--ts-->
   * [About](#about)
   * [Setup Server](#setup)
     * [Windows](#windows)
     * [Unix](#unix)
   * [Software](#software)
   * [Useful Resources and Tools](#useful-resources-and-tools)
   * [Contact](#contact)
<!--te-->



<!-- ABOUT -->
## About
Quick tutorial to setup a Cloud Server for multiple machines access, and VFX Pipeline on Windows, macOS and Linux.
This repository is based on [Google Drive VFX Server](https://github.com/healkeiser/google_drive_vfx_server), with loads of improvements.



<!-- SETUP SERVER -->
## Setup Server

First, you'll need to mount your Cloud server on your system, using any software you like ([rclone](https://rclone.org/), [Google Drive File Stream](https://support.google.com/a/answer/7491144?hl=en), etc.)

We can then start moving files around. The setup only relies on environment variables:
 - `SERVER_ROOT`: The root of the mounted Cloud server. This is the only value that needs to be changed depending on your setup
 - `CONFIG_ROOT`: The `.config` folder
 - `ENVIRONMENT_ROOT`: the `.config/environment` folder
 - `PIPELINE_ROOT`: the `.config/pipeline` folder
 
You can now download the code from this repository and extract its content to your `SERVER_ROOT`. Using `Z:/My Drive` as the mounted Cloud server path, it should look like this: 

``` bash
.
└── 📁 Z:/My Drive/
    └── 📁 .config/
        ├── 📁 environment
        └── 📁 pipeline
```

Which equals to:

``` bash
.
└── 📁 $SERVER_ROOT/
    └── 📁 $CONFIG_ROOT/
        ├── 📁 $ENVIRONMENT_ROOT
        └── 📁 $PIPELINE_ROOT
```

You will need to modify `SERVER_ROOT` in [.zshrc](.config/environment/unix/.zshrc) (**Unix**) and/or [dcc.bat](.config/environment/windows/dcc.bat) (**Windows**) by your mounted Cloud server path:
- In [.zshrc](.config/environment/unix/.zshrc): `export SERVER_ROOT="Path/to/drive/linux"` (Line 12, 17, 21)
- In [dcc.bat](.config/environment/windows/dcc.bat): `setx SERVER_ROOT "Path\to\drive\windows"` (Line 9)

Once the folder structure is created and the `SERVER_ROOT` value has been modified, you can now assign the environment variables:
 
### Windows

**Windows** supports shell scripting after some [manipulations](https://walterteng.com/using-zsh-on-windows) but it's way easier to "*hard*" write the environment variables by running [dcc.bat](.config/environment/windows/dcc.bat).
To check that everything is working:
- Type <kbd> Win </kbd> + <kbd> I </kbd> to open the Windows Settings
- Scroll to the bottom of the page and click `About`
- Navigate to `Device Specifications` and press `Advanced System Settings`
- In the `System Properties` dialogue box, hit `Environmental Variables`
- The freshly created variables should be under `User`
- Check is `SERVER_ROOT` has been defined with the right path

### Unix

**macOS** and **Linux** are both Unix based OS. 
The simplest way is to migrate your shell to `Zsh` using `chsh -s $(which zsh)` in your terminal.
You can then symlink [.zshrc](.config/environment/unix/.zshrc) in your `$HOME` folder.
To check that everything is working, restart your terminal and type `echo $SERVER_ROOT`: it should output your mounted Cloud server path.

> **Warning**<br>
> [.zshrc](.config/environment/unix/.zshrc) needs to be called exactly that way in `$HOME` to be picked up by the terminal: remove any `alias` or `symlink` added in the name.

> **Warning**<br>
> The `Make Alias` command in macOS Finder won't work properly. You should use this service instead to create proper Symlinks: [Symbolic Linker](https://github.com/nickzman/symboliclinker/releases)



<!-- SOFTWARE -->
## Software
This setup automatically links the following DCCs, using this folder structure:

``` bash
.
└── 📁 $SERVER_ROOT/
    └── 📁 .config/
        ├── 📁 environment
        └── 📁 pipeline/
            ├── 📁 houdini               ──> Using $HSITE
            ├── 📁 maya                  ──> Using $MAYA_APP_DIR
            ├── 📁 nuke                  ──> Using $NUKE_PATH
            ├── 📁 other   
            └── 📁 substance_painter     
                └── 📁 python            ──> Using $SUBSTANCE_PAINTER_PLUGINS_PATH
```

The DDCs can be launched normally on **Windows** if the [dcc.bat](.config/environment/windows/dcc.bat) file has been used to define the environment variables. 

For **macOS** and **Linux**, you should start them from a terminal, in order to inherit the environment variables defined by [.zshrc](.config/environment/unix/.zshrc). 

You can find an example script for Houdini just here: [houdini.sh](.config/environment/unix/houdini.sh).

To access it quickly, we also defined an alias for `houdini` pointing to that script in [aliases.sh](.config/environment/unix/aliases.sh). It will allow you to simply type one of those tree commands to launch Houdini.

### <img src="https://cdn.worldvectorlogo.com/logos/maya-2017.svg" alt="Maya" width="20"/> Maya

*WIP*

``` bash
.
└── 📁 $SERVER_ROOT/
    └── 📁 .config/
        ├── 📁 environment
        └── 📁 pipeline/
            └── 📁 maya/
                └── 📁 2023/
                    ├── 📄 Maya.env
                    ├── 📁 prefs
                    ├── 📁 presets
                    └── 📁 scripts
```

### <img src="https://cdn.worldvectorlogo.com/logos/substance-painter.svg" alt="Substance" width="20"/> Substance Painter

*WIP*

``` bash
.
└── 📁 $SERVER_ROOT/
    └── 📁 .config/
        ├── 📁 environment
        └── 📁 pipeline/
            └── 📁 substance_painter/
                └── 📁 python/
                    └── 📄 plugin.py
```

### <img src="https://secure.meetupstatic.com/photos/event/b/9/f/6/600_494327606.jpeg" alt="Houdini" width="20"/> Houdini

Houdini will automatically scan the folder defined by `$HSITE` for any folder being named `houdini<houdini version>/<recognized folder>` such as `otls` or `packages` and load the content of those folders at Houdini startup.

> **Note**<br>
> See [Configuring Houdini](https://www.sidefx.com/docs/houdini/basics/config.html#path)

You can find two package file examples:
- A generic [plugin_name.json](.config/pipeline/houdini/houdini19.5/packages/plugin_name.json)
- An [arnold.json](.config/pipeline/houdini/houdini19.5/packages/arnold.json)

Both taking advantage of the environment variables posteriorly defined.

``` bash
.
└── 📁 $SERVER_ROOT/
    └── 📁 .config/
        ├── 📁 environment
        └── 📁 pipeline/
            └── 📁 houdini/
                └── 📁 houdini19.5/
                    ├── 📁 desktop
                    ├── 📁 otls/
                    │   └── 📄 digital_asset.hda
                    └── 📁 packages/
                        └── 📄 package.json
```

### <img src="https://www.foundry.com/sites/default/files/2021-03/ICON_NUKE-rgb-yellow-01.png" alt="Nuke" width="20"/> Nuke

Nuke will scan the content of the folder defined by `NUKE_PATH`, searching for `init.py` and `menu.py`.

> **Note**<br>
> See [What are the init.py and menu.py files](https://support.foundry.com/hc/en-us/articles/360003811839-Q100490-What-are-the-init-py-and-menu-py-files)

You can find an [init.py](.config/pipeline/nuke/init.py) file example, showing how to load plugins on Nuke startup.

``` bash
.
└── 📁 $SERVER_ROOT/
    └── 📁 .config/
        ├── 📁 environment
        └── 📁 pipeline/
            └── 📁 nuke/
                ├── 📄 init.py
                └── 📄 menu.py
```



<!-- RESSOURCES -->
## Useful Resources and Tools
- [HSITE](https://www.sidefx.com/docs/houdini/basics/config.html "SideFX: $HSITE")
- [Packages](https://www.sidefx.com/docs/houdini/ref/plugins.html "SideFX: Packages")



<!-- CONTACT -->
## Contact

Project Link: [Cloud VFX Server](https://github.com/healkeiser/cloud_vfx_server)

<p align='left'>
  <a href="https://www.linkedin.com/in/valentin-beaumont">
  <img src="https://img.shields.io/badge/-LinkedIn-0A66C2?style=for-the-badge&logo=linkedin" alt="LinkedIn"/></a> 
  <a href="https://www.behance.net/el1ven">
  <img src="https://img.shields.io/badge/-Behance-313131?style=for-the-badge&logo=behance" alt="Behance"/></a> 
  <a href="https://twitter.com/valentinbeaumon">
  <img src="https://img.shields.io/badge/-Twitter-E1E8ED?style=for-the-badge&logo=twitter" alt="Twitter"/></a> 
  <a href="https://www.instagram.com/val.beaumontart">
  <img src="https://img.shields.io/badge/-Instagram-85255b?style=for-the-badge&logo=instagram" alt="Instagram"/></a>  
</p>

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png)](https://www.buymeacoffee.com/healkeiser)
