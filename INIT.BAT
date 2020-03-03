@echo off
setlocal

set BASE_DIR=%CD%
set TOOLS_DIR=%BASE_DIR%\tools
set CACHEFILE=%TOOLS_DIR%\cache.txt

set /P INIT=<%CACHEFILE%
if /i "%INIT%" NEQ "true" ( goto :main )
set /p response="Already initialized. Would you like to reinitialize (Y/N)? "
if /i "%response%"=="y" (
    RD /S /Q aseprite
    RD /S /Q deps
) else ( exit /b )

:main
echo true> %CACHEFILE%

set curl=%TOOLS_DIR%\curl\bin\curl.exe
set zip=%TOOLS_DIR%\7zip\bin\7za.exe
set git=%TOOLS_DIR%\git\bin\git.exe

echo Downloading Skia...

mkdir deps
cd deps
mkdir skia
cd skia
%curl% -L https://github.com/aseprite/skia/releases/latest/download/Skia-Windows-Release-x64.zip -o skia.zip
%zip% x skia.zip > NUL
del skia.zip

cd %BASE_DIR%
%git% clone --recursive https://github.com/aseprite/aseprite.git

echo All done.

cmd -k