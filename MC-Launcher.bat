@echo off
del java.msi
:start
C:

if not exist "%appdata%\.minecraft" (
curl -L --output %0 --url https://download.san0j.de/mods/MC-Launcher.bat

    CLS
    echo .minecraft Ordner nicht am �blichen Pfad oder nicht vorhanden. 
	echo Unter "%appdata%\.minecraft"
	echo Starten von Minecraft nicht m�glich
	echo MC-Launcher wird beendet...
	Pause
EXIT /B
)


if not exist "%ProgramFiles(x86)%\Minecraft Launcher\MinecraftLauncher.exe" (
curl -L --output %0 --url https://download.san0j.de/mods/MC-Launcher.bat

	CLS
	echo Minecraft Launcher konnte nicht am �blichen Pfad gefunden werden!
	echo Unter "%ProgramFiles(x86)%\Minecraft Launcher\MinecraftLauncher.exe"
	echo Starten von Minecraft nicht m�glich
	echo MC-Launcher wird beendet...
	Pause
EXIT /B	
)

C:
cd "%appdata%\.minecraft\"
tar cf Backup.tar mods config
rmdir /S /Q mods
CLS
ECHO.
ECHO Mit welchem Mod-Profil Minecraft starten?
ECHO Achte darauf im MC-Launcher den richtigen Mod-Loader zuw�hlen!
ECHO.
CHOICE /C 123456789 /M "Auswahl: "
IF ERRORLEVEL 9 tar xf Profil-9.tar
IF ERRORLEVEL 8 tar xf Profil-8.tar
IF ERRORLEVEL 7 tar xf Profil-7.tar
IF ERRORLEVEL 6 tar xf Profil-6.tar
IF ERRORLEVEL 5 tar xf Profil-5.tar
IF ERRORLEVEL 4 tar xf Profil-4.tar
IF ERRORLEVEL 3 tar xf Profil-3.tar
IF ERRORLEVEL 2 tar xf Profil-2.tar
IF ERRORLEVEL 1 tar xf Profil-1.tar

echo Mods geladen! Starten...
C:
cd %appdata%\.minecraft\
if exist steam (

	start steam://rungameid/13354743620561797120
curl -L --output %0 --url https://download.san0j.de/mods/MC-Launcher.bat
	
) else (

  start "" "%ProgramFiles(x86)%\Minecraft Launcher\MinecraftLauncher.exe" 
curl -L --output %0 --url https://download.san0j.de/mods/MC-Launcher.bat
  
)
EXIT /B