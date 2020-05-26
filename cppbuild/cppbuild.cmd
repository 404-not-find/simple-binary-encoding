@if "%DEBUG%" == "" @echo off
setlocal EnableDelayedExpansion

set SOURCE_DIR=%CD%
set BUILD_DIR=%CD%\cppbuild\Release

call cppbuild/vs-helper.cmd
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

if EXIST %BUILD_DIR% rd /S /Q %BUILD_DIR%

md %BUILD_DIR%
pushd %BUILD_DIR%

cmake --build . --clean-first --config Release
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

ctest -C Release
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%
