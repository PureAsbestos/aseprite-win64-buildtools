This is a build toolchain to download and compile Aseprite and its dependencies on 64-bit Windows. It contains neither source nor binaries of Aseprite or its dependencies, which are copyrighted by their respective owners.

Please use the version in releases which contains all the tools needed by the scripts. Tool binaries included in releases are copyrighted by their respective owners, and I have tried to comply with the respective licenses. Please notify me of any non-compliance by creating an issue.

To perform first-time setup, or start over from scratch, run INIT.BAT
To build, run BUILD.BAT (output is ./aseprite/build/bin)
To update JUST the Aseprite source, run UPDATE.BAT

You must have Visual Studio 2019 installed at "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\" for the build script to work. If it is installed somewhere else, you'll have to change the location in the build script. Additionally, if you have MinGW/gcc installed, you may have to set the IGNORE_DIR in the build script.