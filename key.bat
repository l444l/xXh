@echo off
for /f "tokens=*" %%i in ('netsh wlan show profiles ^| findstr /R /C:"All User Profile"') do (
    set "profile=%%i"
    setlocal enabledelayedexpansion
    set "profile=!profile:All User Profile     : =!"
    echo Profile Name: !profile!
    for /f "tokens=2*" %%j in ('netsh wlan show profile name^="!profile!" key^=clear ^| findstr /R /C:"Key Content"') do (
        echo Password: %%k
    )
    endlocal
    echo.
)
pause
