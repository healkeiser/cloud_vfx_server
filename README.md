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
     * [Windows](wWindows)
     * [Unix](#unix)
   * [Software](#software)
   * [Tips](#tips)
   * [Roadmap](#roadmap)
   * [Useful Resources and Tools](#useful-resources-and-tools)
   * [Contact](#contact)
<!--te-->



<!-- ABOUT -->
## About
Quick tutorial to setup a Cloud Server for multiple machines access, and VFX Pipeline on Windows, macOS and Linux.
This repository is based on [Google Drive VFX Server](https://github.com/healkeiser/google_drive_vfx_server), with loads of improvments.



<!-- SETUP SERVER -->
## Setup Server

The setup is pretty straigthforward and only relies on environment variables:
 - `SERVER_ROOT`: The root of the mounted Cloud drive
 - `CONFIG_ROOT`: The `.config` folder
 - `ENVIRONMENT_ROOT`: the `.config/environment` folder
 - `PIPELINE_ROOT`: the `.config/pipeline` folder

You will need to modify `SERVER_ROOT` in [.zshrc](https://github.com/healkeiser/cloud_vfx_server/blob/main/.config/environment/unix/.zshrc) and/or [dcc.bat](https://github.com/healkeiser/cloud_vfx_server/blob/main/.config/environment/windows/dcc.bat) by your mounted Cloud server path.

> in [.zshrc](https://github.com/healkeiser/cloud_vfx_server/blob/main/.config/environment/unix/.zshrc): `export SERVER_ROOT="Path/to/drive/linux"` (Line 12, 17, 21)

> in [dcc.bat](https://github.com/healkeiser/cloud_vfx_server/blob/main/.config/environment/windows/dcc.bat): `setx SERVER_ROOT "Path\to\drive\windows"` (Line 9)

### <img src="https://cdn.worldvectorlogo.com/logos/microsoft-windows-22.svg" alt="Windows" width="15"/> Windows

Windows support shell script but it's way easier to "hard" write the environment variables by running [dcc.bat](https://github.com/healkeiser/cloud_vfx_server/blob/main/.config/environment/windows/dcc.bat).

### <img src="https://1000marcas.net/wp-content/uploads/2020/01/Unix-Logo.png" alt="Unix" width="20"/> Unix

macOS and Linux are both Unix based OS. 
The simplest way is to migrate your shell to `Zsh` using `chsh -s $(which zsh)` in your terminal.
You can then symlink [.zshrc](https://github.com/healkeiser/cloud_vfx_server/blob/main/.config/environment/unix/.zshrc) in your `$HOME` folder.

> [.zshrc](https://github.com/healkeiser/cloud_vfx_server/blob/main/.config/environment/unix/.zshrc) needs to be called exactly that way in `$HOME` to be picked up by the terminal: remove any `alias` or `symlink` added in the name.




<!-- SOFTWARE -->
## Software

### <img src="https://cdn.worldvectorlogo.com/logos/maya-2017.svg" alt="Maya" width="15"/> Maya

*WIP*

### <img src="https://cdn.worldvectorlogo.com/logos/substance-painter.svg" alt="Substance" width="15"/> Substance Painter

*WIP*

### <img src="https://secure.meetupstatic.com/photos/event/b/9/f/6/600_494327606.jpeg" alt="Houdini" width="15"/> Houdini

*WIP*

### <img src="https://www.foundry.com/sites/default/files/2021-03/ICON_NUKE-rgb-yellow-01.png" alt="Nuke" width="15"/> Nuke

*WIP*

### <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Adobe_After_Effects_CC_icon.svg/512px-Adobe_After_Effects_CC_icon.svg.png" alt="After Effects" width="15"/> After Effects

*WIP*



<!-- TIPS -->
## Tips



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
