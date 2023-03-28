:: Description: Variables, environment and functions for the DCCs.
:: Author: Valentin Beaumont
:: Mail:valentin.onze@gmail.com

@echo off

:: Cloud (used as a server equivalent)
echo.
echo "Cloud - SERVER_ROOT:"
set SERVER_ROOT "Path\to\Cloud"
setx SERVER_ROOT "%SERVER_ROOT%"
:: echo %SERVER_ROOT%
echo.

echo "Cloud - CONFIG_ROOT:"
set CONFIG_ROOT "%SERVER_ROOT%\.config"
setx CONFIG_ROOT "%CONFIG_ROOT%"
:: echo %CONFIG_ROOT%
echo.

echo "Cloud - ENVIRONMENT_ROOT:"
setx ENVIRONMENT_ROOT "%CONFIG_ROOT%\environment"
:: echo %ENVIRONMENT_ROOT%
echo.

echo "Cloud - PIPELINE_ROOT:"
set PIPELINE_ROOT "%CONFIG_ROOT%\pipeline"
setx PIPELINE_ROOT "%PIPELINE_ROOT%"
:: echo %PIPELINE_ROOT%
echo.

:: Houdinih
echo "Houdini - HSITE:"
setx HSITE "%PIPELINE_ROOT%\houdini"
:: echo %HSITE%
echo.

:: Maya
echo "Maya - MAYA_APP_DIR:"
setx MAYA_APP_DIR "%PIPELINE_ROOT%\maya"
:: echo %MAYA_APP_DIR%
echo.

:: Nuke
echo "Nuke - NUKE_PATH:"
setx NUKE_PATH "%PIPELINE_ROOT%\nuke"
:: echo %NUKE_PATH%
echo.

:: Substance Painter
echo "Substance Painter - SUBSTANCE_PAINTER_PLUGINS_PATH:"
setx SUBSTANCE_PAINTER_PLUGINS_PATH "%PIPELINE_ROOT%\substance_painter\python"
:: echo %SUBSTANCE_PAINTER_PLUGINS_PATH%
echo.

pause

