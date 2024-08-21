<div align="center">

  <a href="https://github.com/healkeiser/cloud_vfx_server">
    <img src="https://cdn-icons-png.flaticon.com/512/2345/2345350.png" alt="Logo" width="80" ></a>

  <h3 align="center">Cloud VFX Server</h3>

  <p align="center">
    Setup cloud as a VFX server.
    <br/><br/>
  </p>

  ##

  <p align="center">
    <!-- Maintenance status -->
    <img src="https://img.shields.io/badge/maintenance-as--is-yellow?&label=Maintenance">&nbsp;&nbsp;
    <!-- <img src="https://img.shields.io/badge/maintenance-deprecated-red.svg?&label=Maintenance"> -->
    <!-- License -->
    <!-- <img src="https://img.shields.io/badge/License-MIT-brightgreen.svg?&logo=open-source-initiative&logoColor=white" alt="License: MIT"/>&nbsp;&nbsp; -->
    <!-- PyPI -->
    <!-- <a href="https://pypi.org/project/cloud_vfx_server">
      <img src="https://img.shields.io/pypi/v/cloud_vfx_server?&logo=pypi&logoColor=white&label=PyPI" alt="PyPI version"/></a>&nbsp;&nbsp; -->
    <!-- Last Commit -->
    <img src="https://img.shields.io/github/last-commit/healkeiser/cloud_vfx_server?logo=github&label=Last%20Commit" alt="Last Commit"/>&nbsp;&nbsp;
    <!-- Commit Activity -->
    <a href="https://github.com/healkeiser/cloud_vfx_server/pulse" alt="Activity">
      <img src="https://img.shields.io/github/commit-activity/m/healkeiser/cloud_vfx_server?&logo=github&label=Commit%20Activity"/></a>&nbsp;&nbsp;
    <!-- GitHub stars -->
    <img src="https://img.shields.io/github/stars/healkeiser/cloud_vfx_server" alt="GitHub Stars"/>&nbsp;&nbsp;
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

![dcc.bat](docs/images/WindowsTerminal_TFypL9uhfG.png)

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

> [!WARNING]
> [.zshrc](.config/environment/unix/.zshrc) needs to be called exactly that way in `$HOME` to be picked up by the terminal: remove any `alias` or `symlink` added in the name.

> [!WARNING]
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

To access it quickly, we also defined an alias for `houdini` pointing to that script in [aliases.sh](.config/environment/unix/aliases.sh). It will allow you to simply type this command to launch Houdini.

### <img src="https://cdn.worldvectorlogo.com/logos/maya-2017.svg" alt="Maya" width="20"/> Maya

*WIP*
> [!NOTE]
> See [Maya file path variables](https://help.autodesk.com/view/MAYAUL/2022/ENU/?guid=GUID-228CCA33-4AFE-4380-8C3D-18D23F7EAC72)

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
> **Note**<br>
> See [Substance Painter environment variables](https://substance3d.adobe.com/documentation/spdoc/environment-variables-172823292.html)

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

> [!NOTE]
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

> [!NOTE]
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

<p align='center'>
  <!-- GitHub profile -->
  <a href="https://github.com/healkeiser">
    <img src="https://img.shields.io/badge/healkeiser-181717?logo=github&style=social" alt="GitHub"/></a>&nbsp;&nbsp;
  <!-- LinkedIn -->
  <a href="https://www.linkedin.com/in/valentin-beaumont">
    <img src="https://img.shields.io/badge/Valentin%20Beaumont-0A66C2?logo=linkedin&style=social" alt="LinkedIn"/></a>&nbsp;&nbsp;
  <!-- Behance -->
  <a href="https://www.behance.net/el1ven">
    <img src="https://img.shields.io/badge/el1ven-1769FF?logo=behance&style=social" alt="Behance"/></a>&nbsp;&nbsp;
  <!-- X -->
  <a href="https://twitter.com/valentinbeaumon">
    <img src="https://img.shields.io/badge/@valentinbeaumon-1DA1F2?logo=x&style=social" alt="Twitter"/></a>&nbsp;&nbsp;
  <!-- Instagram -->
  <a href="https://www.instagram.com/val.beaumontart">
    <img src="https://img.shields.io/badge/@val.beaumontart-E4405F?logo=instagram&style=social" alt="Instagram"/></a>&nbsp;&nbsp;
  <!-- Gumroad -->
  <a href="https://healkeiser.gumroad.com/subscribe">
    <img src="https://img.shields.io/badge/healkeiser-36a9ae?logo=gumroad&style=social" alt="Gumroad"/></a>&nbsp;&nbsp;
  <!-- Gmail -->
  <a href="mailto:valentin.onze@gmail.com">
    <img src="https://img.shields.io/badge/valentin.onze@gmail.com-D14836?logo=gmail&style=social" alt="Email"/></a>&nbsp;&nbsp;
  <!-- Buy me a coffee -->
  <a href="https://www.buymeacoffee.com/healkeiser">
    <img src="https://img.shields.io/badge/Buy Me A Coffee-FFDD00?&logo=buy-me-a-coffee&logoColor=black" alt="Buy Me A Coffee"/></a>&nbsp;&nbsp;
</p>