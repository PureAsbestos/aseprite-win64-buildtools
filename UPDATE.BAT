@echo off
cd aseprite
git pull
git submodule update --init --recursive
cd ..

cmd -k