@echo off
setlocal


REM #### SET THIS TO YOUR GCC FOLDER IF YOU HAVE GCC ON PATH ####
set IGNORE_DIR=D:\msys64\mingw64\bin\
REM #############################################################


call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat" -arch=x64

set BASE_DIR=%CD%
set TOOLS_DIR=%BASE_DIR%\tools

set cmake=%TOOLS_DIR%\cmake\bin\cmake.exe
set ninja=%TOOLS_DIR%\ninja\bin\ninja.exe

cd %BASE_DIR%\aseprite

mkdir build
cd build
%cmake% -Wno-dev -DCMAKE_IGNORE_PATH=%IGNORE_DIR% -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLAF_BACKEND=skia -DSKIA_DIR=%BASE_DIR%\deps\skia -DSKIA_LIBRARY_DIR=%BASE_DIR%\deps\skia\out\Release-x64 -DSKIA_LIBRARY=%BASE_DIR%\deps\skia\out\Release-x64\skia.lib -G Ninja ..
%ninja% aseprite

cd %BASE_DIR%
cmd -k