:: ------ Description: Variables , environment and functions for the DCCs.
:: ------ Author: Valentin Beaumont
:: ------ Mail:valentin.onze@gmail.com

@echo off

:: ------ Cloud (used as a server equivalent)
echo "Cloud - SERVER_ROOT:"
setx SERVER_ROOT "Path\to\drive\windows"
echo %SERVER_ROOT%
echo.

echo "Cloud - CONFIG_ROOT:"
setx CONFIG_ROOT "%SERVER_ROOT%\.config"
echo %CONFIG_ROOT%
echo.

echo "Cloud - ENVIRONMENT_ROOT:"
setx ENVIRONMENT_ROOT "%CONFIG_ROOT%\environment"
echo %ENVIRONMENT_ROOT%
echo.

echo "Cloud - PIPELINE_ROOT:"
setx PIPELINE_ROOT "%CONFIG_ROOT%\pipeline"
echo  %PIPELINE_ROOT%
echo.

:: ------ Create $HOME for easier integration with Unix systems
echo "Home - HOME:"
setx HOME "C:\Users\%USERNAME%"
echo  %HOME%
echo.

:: ------ Houdini
echo "Houdini - HSITE:"
setx HSITE "%PIPELINE_ROOT%\houdini"
echo %HSITE%
echo.

:: ------ Maya
echo "Maya - MAYA_APP_DIR:"
setx MAYA_APP_DIR "%PIPELINE_ROOT%\maya"
echo %MAYA_APP_DIR%
echo.

:: ------ Nuke
echo "Nuke - NUKE_PATH:"
setx NUKE_PATH "%PIPELINE_ROOT%\nuke"
echo %NUKE_PATH%
echo.

:: ------ Substance Painter
echo "Substance Painter - SUBSTANCE_PAINTER_PLUGINS_PATH:"
setx SUBSTANCE_PAINTER_PLUGINS_PATH "%PIPELINE_ROOT%\substance_painter\python"
echo %SUBSTANCE_PAINTER_PLUGINS_PATH%
echo.

pause
