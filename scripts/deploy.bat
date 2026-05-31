@echo off
setlocal

set "PLUGIN_NAME=yugen-ash.nvim"

rem Resolve the plugin root (parent of this script's directory) to an absolute path.
for %%I in ("%~dp0..") do set "PLUGIN_DIR=%%~fI"

rem Neovim's data dir on Windows is %LOCALAPPDATA%\nvim-data (stdpath("data")).
set "TARGET_DIR=%LOCALAPPDATA%\nvim-data\lazy\%PLUGIN_NAME%"

if not exist "%LOCALAPPDATA%\nvim-data\lazy" mkdir "%LOCALAPPDATA%\nvim-data\lazy"

if exist "%TARGET_DIR%" rmdir /s /q "%TARGET_DIR%"

robocopy "%PLUGIN_DIR%" "%TARGET_DIR%" /E /NFL /NDL /NJH /NJS /NP >nul

rem robocopy uses exit codes 0-7 for success; 8 and above indicate failure.
if errorlevel 8 (
	echo Deploy failed.
	exit /b 1
)

echo Deployed to: %TARGET_DIR%
endlocal
