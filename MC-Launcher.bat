@echo off
:start
curl -L -o %0 https://dl.san0j.de/mods/MC-Launcher.bat
del "%userprofile%\AppData\Local\Temp\java.msi"
del "%userprofile%\AppData\Local\Temp\MC-Install.msi"
set /p steam=<%appdata%\.minecraft\steam.txt
CLS
C:
    where java >nul 2>nul
    if %errorlevel%==1 (    
	echo.
	echo  Java ist nicht installiert, da es ben�tigt wird, wird es nun installiert! 
	echo  Von https://san0j.de/corretto
	echo  Starten?
	Pause
	echo  Nach der beendigung der Instalation starte den Launcher einfach neu!
	echo  Bitte warten!
	C:
	cd "%userprofile%\AppData\Local\Temp"
	curl -L -o java.msi https://corretto.aws/downloads/latest/amazon-corretto-16-x64-windows-jdk.msi
    start "" java.msi
	echo  Fertig? Neustarten?
	Pause
	GOTO start
)

if not exist "%ProgramFiles(x86)%\Minecraft Launcher\MinecraftLauncher.exe" (
	CLS
	echo  Der Minecraft Launcher konnte nicht am �blichen Pfad gefunden werden!
	echo  Unter "%ProgramFiles(x86)%\Minecraft Launcher\MinecraftLauncher.exe"
	echo  Starten von Minecraft nicht m�glich!
	echo  Minecraft wird nun installiert.
	echo  Starten?
	Pause
	echo  Nach der beendigung der Instalation starte den Launcher einfach neu!
	echo  Bitte warten!
	C:
	cd "%userprofile%\AppData\Local\Temp"
	curl -L -o MC-Install.msi https://launcher.mojang.com/download/MinecraftInstaller.msi
    start "" MC-Install.msi
	echo  Fertig? Neustarten?
	Pause
	GOTO start
)

if not exist "%appdata%\.minecraft" (
    CLS
    echo  .minecraft Ordner nicht am �blichen Pfad oder nicht vorhanden. 
	echo  Unter "%appdata%\.minecraft"
	echo  Starten von Minecraft nicht m�glich
	echo  Soll der Minecraft Launcher ge�ffnet werden und es dannach erneut getestet werden?
	Pause
	start "" "%ProgramFiles(x86)%\Minecraft Launcher\MinecraftLauncher.exe"
	TASKKILL /T /F /IM MinecraftLauncher*
	GOTO start
)

C:
cd "%appdata%\.minecraft\"
CLS
echo.
echo  Mit welchem Mod-Profil Minecraft starten?
echo  W�hle zwischen Profil 1-8 und 9 wenn nichts geladen werden soll!
echo  Achte darauf im MC-Launcher den richtigen Mod-Loader zuw�hlen!
echo.
CHOICE /C 123456789 /M " Auswahl: "
IF ERRORLEVEL 9 GOTO mcl
IF ERRORLEVEL 8 tar cf Backup.tar mods config optionsof.txt options.txt servers.dat & rmdir /S /Q mods & tar xf Profil-8.tar
IF ERRORLEVEL 7 tar cf Backup.tar mods config optionsof.txt options.txt servers.dat & rmdir /S /Q mods & tar xf Profil-7.tar
IF ERRORLEVEL 6 tar cf Backup.tar mods config optionsof.txt options.txt servers.dat & rmdir /S /Q mods & tar xf Profil-6.tar
IF ERRORLEVEL 5 tar cf Backup.tar mods config optionsof.txt options.txt servers.dat & rmdir /S /Q mods & tar xf Profil-5.tar
IF ERRORLEVEL 4 tar cf Backup.tar mods config optionsof.txt options.txt servers.dat & rmdir /S /Q mods & tar xf Profil-4.tar
IF ERRORLEVEL 3 tar cf Backup.tar mods config optionsof.txt options.txt servers.dat & rmdir /S /Q mods & tar xf Profil-3.tar
IF ERRORLEVEL 2 tar cf Backup.tar mods config optionsof.txt options.txt servers.dat & rmdir /S /Q mods & tar xf Profil-2.tar
IF ERRORLEVEL 1 tar cf Backup.tar mods config optionsof.txt options.txt servers.dat & rmdir /S /Q mods & tar xf Profil-1.tar
:mcl
C:
cd %appdata%\.minecraft\
if exist steam.txt (
  start "" "steam://rungameid/%steam%"
) else (
  start "" "%ProgramFiles(x86)%\Minecraft Launcher\MinecraftLauncher.exe" 
)
EXIT /B