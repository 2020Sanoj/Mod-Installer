@echo off
C:
cd %appdata%\.minecraft
curl -sL -o fabric.jar https://dl.sancraft.dev/fa
java -jar fabric.jar client -mcversion 1.17.1 -launcher win32 -loader 0.12.8
java -jar fabric.jar client -mcversion 1.17.1 -launcher microsoft_store -loader 0.12.8
del /S /Q fabric.jar
