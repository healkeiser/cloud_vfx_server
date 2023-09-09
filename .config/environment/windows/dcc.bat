:: Description: Set environment variables for various applications.
:: Author: Valentin Beaumont
:: Mail: valentin.onze@gmail.com

@echo off
setlocal

:: Temporary values, only valid in this shell
:: Set variables (use quotes around values with spaces)
set "SERVER_ROOT=C:\Users\valen\OneDrive"
set "CONFIG_ROOT=%%SERVER_ROOT%%\.config"
set "ENVIRONMENT_ROOT=%%CONFIG_ROOT%%\environment"
set "PIPELINE_ROOT=%%CONFIG_ROOT%%\pipeline"

set "HSITE=%%PIPELINE_ROOT%%\houdini"
set "MAYA_APP_DIR=%%PIPELINE_ROOT%%\maya"
set "NUKE_PATH=%%PIPELINE_ROOT%%\nuke"
set "SUBSTANCE_PAINTER_PLUGINS_PATH=%%PIPELINE_ROOT%%\substance_painter\python"

:: Header
echo.
powershell write-host -foregroundcolor White "Cloud VFX Server"
echo https://github.com/healkeiser/cloud_vfx_server
echo.

:: Lasting values, saved in the system
:: Set environment variables
setx "SERVER_ROOT" "%SERVER_ROOT%"
powershell write-host -foregroundcolor Green "SERVER_ROOT: %SERVER_ROOT%"

setx "CONFIG_ROOT" "%CONFIG_ROOT%"
powershell write-host -foregroundcolor Green "CONFIG_ROOT: %CONFIG_ROOT%"
powershell write-host -foregroundcolor Green "-> Expanded: %SERVER_ROOT%%\.config"

setx "ENVIRONMENT_ROOT" "%ENVIRONMENT_ROOT%"
powershell write-host -foregroundcolor Green "ENVIRONMENT_ROOT: %ENVIRONMENT_ROOT%"
powershell write-host -foregroundcolor Green "-> Expanded: %SERVER_ROOT%\.config\environment"

setx "PIPELINE_ROOT" "%PIPELINE_ROOT%"
powershell write-host -foregroundcolor Green "PIPELINE_ROOT: %PIPELINE_ROOT%"
powershell write-host -foregroundcolor Green "-> Expanded: %SERVER_ROOT%\.config\pipeline"

:: Set application-specific variables
echo.
echo ===========================================================================
echo.
powershell write-host -foregroundcolor Red "SideFX Houdini"
setx "HSITE" "%HSITE%"
powershell write-host -foregroundcolor Red "HSITE: %HSITE%"
powershell write-host -foregroundcolor Red "-> Expanded: %SERVER_ROOT%\.config\pipeline\houdini"

echo.
echo ===========================================================================
echo.
powershell write-host -foregroundcolor White "Autodesk Maya"
setx "MAYA_APP_DIR" "%MAYA_APP_DIR%"
powershell write-host -foregroundcolor Cyan "MAYA_APP_DIR: %MAYA_APP_DIR%"
powershell write-host -foregroundcolor Cyan "-> Expanded: %SERVER_ROOT%\.config\pipeline\maya"

echo.
echo ===========================================================================
echo.
powershell write-host -foregroundcolor White "Foundry Nuke"
setx "NUKE_PATH" "%NUKE_PATH%"
powershell write-host -foregroundcolor Yellow "NUKE_PATH: %NUKE_PATH%"
powershell write-host -foregroundcolor Yellow "-> Expanded: %SERVER_ROOT%\.config\pipeline\nuke"

echo.
echo ===========================================================================
echo.
powershell write-host -foregroundcolor White "Adobe Substance Painter"
setx "SUBSTANCE_PAINTER_PLUGINS_PATH" "%SUBSTANCE_PAINTER_PLUGINS_PATH%"
powershell write-host -foregroundcolor DarkGreen "SUBSTANCE_PAINTER_PLUGINS_PATH: %SUBSTANCE_PAINTER_PLUGINS_PATH%"
powershell write-host -foregroundcolor DarkGreen "-> Expanded: %SERVER_ROOT%\.config\pipeline\substance_painter\python"

:: End
echo.
echo ===========================================================================
echo.
pause
