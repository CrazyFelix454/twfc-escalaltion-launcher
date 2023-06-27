@echo off
title WFC - Escalation Launcher
color 07

@REM Please do not alter VERSION or AUTHOR
@set VERSION=0.2
@set AUTHOR=Grumpee (CrazyFelix454 on GitHub)


:START
    echo.
    echo.
    TIMEOUT 1 >nul
    echo ---------------------------------
    echo   db   d8b   db d88888b  .o88b.
    echo   88   I8I   88 88'     d8P  Y8 
    echo   88   I8I   88 88ooo   8P 
    echo   Y8   I8I   88 88~~~   8b 
    echo   `8b d8'8b d8' 88      Y8b  d8 
    echo    `8b8' `8d8'  YP       `Y88P'
    echo ---------------------------------
    echo.
    echo        Escalation Launcher
    echo.
    echo.
    TIMEOUT 1 >nul
    echo Made by: %AUTHOR%
    echo Version: %VERSION%
    echo.
    echo.
    TIMEOUT 1 >nul

:FOLDER_CHECK
    echo.
    @set /P FOLDER_CHECK_ANSWER=Did you place this batch file in the same folder as TWFC.exe? - y/n:
    echo.

    if %FOLDER_CHECK_ANSWER%==y (
        cls
        goto :SELECT_MAP
    ) else if %FOLDER_CHECK_ANSWER%==n (
        cls 
        goto :GET_DRIVE
    ) else (
        cls
        echo.
        echo ERROR :: Unknown response, please try again
        echo.
        goto :FOLDER_CHECK
    )

:GET_DRIVE
    echo.
    echo Type the drive letter that Transformers War For Cybertron is installed on.
    echo Example: C, D, E, etc. (This is does not need to be capitalized)
    echo.
    @set /P DRIVE_LETTER=Drive:
    %DRIVE_LETTER%:
    echo.
    echo Drive changed

:GET_FILE_PATH
    echo.
    echo Type the full file path to Transformers War For Cybertron on your PC.
    echo Example: Steam\steamapps\common\Transformers War for Cybertron\Binaries
    echo.
    @set /P FILE_PATH=Your file path:

    if %FILE_PATH%==EXAMPLE (
        @set FILE_PATH=Steam\steamapps\common\Transformers War for Cybertron\Binaries
    ) else if %FILE_PATH%==example (
        @set FILE_PATH=Steam\steamapps\common\Transformers War for Cybertron\Binaries
    ) else (
        cls
        echo.
        echo Oops... something went wrong, please try again
        goto :GET_FILE_PATH
    )

:CHECK_FILE_PATH
    echo.
    echo %FILE_PATH%
    echo.
    @set /P FILE_PATH_ANSWER=Is the file path above correct? - y/n:

    if %FILE_PATH_ANSWER%==n (
        cls
        goto :GET_FILE_PATH
    ) else if %FILE_PATH_ANSWER%==y (
        cls
        cd %FILE_PATH%
        goto :SELECT_MAP
    ) else (
        echo.
        echo ERROR :: Unknown response, please try again
        goto :CHECK_FILE_PATH
    )

:SELECT_MAP
    @set Broke=MP_ESC_BrokenHope_BASE_m
    @set Rem=MP_ESC_Remnant_BASE_m
    @set Dis=MP_ESC_District_BASE_m
    @REM Do not un-comment Pulse - causes instant game crash
    @REM @set Pul=MP_ESC_Pulse_BASE_m
    @set Sta=MP_ESC_Static_BASE_m
    @set Tra=MP_ESC_Tranquillity_BASE_m

    echo.
    echo.
    echo --------------MAPS--------------
    echo            Broken Hope
    echo              Remnant
    echo             District      *
    @REM echo              Pulse        Mod Required
    echo              Static       *
    echo            Tranquillity   *
    echo --------------------------------
    echo.
    echo Please select a map from the list above.
    echo -- Type 1 for Broken Hope or 2 for Remnant and so on..
    echo.
    echo.
    echo Note: If a map has a '*' next to it, that map is playable but has issues..
    echo (i.e.: broken textures, effects, or audio)
    echo.
    echo.
    @set /P MAP_NAME=Map:

    if %MAP_NAME%==1 (
        @set MAP=%Broke%
        goto :RUN_GAME
    ) else if %MAP_NAME%==2 (
        @set MAP=%Rem%
        goto :RUN_GAME
    ) else if %MAP_NAME%==3 (
        @set MAP=%Dis%
        goto :RUN_GAME
    ) 
    @REM else if %MAP_NAME%==4 (
    @REM     @set MAP=%Pul%
    @REM     goto :RUN_GAME
    @REM ) 
    else if %MAP_NAME%==4 (
        @set MAP=%Sta%
        goto :RUN_GAME
    ) else if %MAP_NAME%==5 (
        @set MAP=%Tra%
        goto :RUN_GAME
    ) else (
        cls
        echo.
        echo ERROR :: Unknown response, please try again
        goto :SELECT_MAP
    )

:RUN_GAME
    echo Launching game...
    twfc %MAP%?Game=TransContent.TnSurvivalGame?GameModeTag=SV?GameTeamStatus=2
    TIMEOUT 30 >nul
    goto :PROCESS_CHECK

:PROCESS_CHECK
    SETLOCAL EnableExtensions
    set EXE=TWFC.exe
    for /F %%x in (
        'tasklist /NH /FI "IMAGENAME eq %EXE%"'
    ) do if %%x == %EXE% goto :PROCESS_FOUND
    goto :PROCESS_NOT_FOUND

:PROCESS_FOUND
    cls
    echo.
    echo %EXE% is running...
    TIMEOUT 5 >nul
    goto :PROCESS_CHECK
:PROCESS_NOT_FOUND
    echo.
    echo %EXE% is not running...
    TIMEOUT 2 >nul
    goto :END_CHECK

:END_CHECK
    echo.
    @set /P END_CHECK_RESPONSE=Are you finished? - y/n:
    
    if %END_CHECK_RESPONSE%==n (
        cls
        goto :SELECT_MAP
    ) else if %END_CHECK_RESPONSE%==y (
        goto :END
    ) else (
        cls
        echo.
        echo ERROR :: Unknown response, please try again
        goto :END_CHECK
    )

:END
    cls
    echo.
    echo This window will now close automatically...
    TIMEOUT 2 >nul
    exit