@echo off
title WFC - Offline Escalation Launcher
color 07

@REM Please do not alter VERSION or AUTHOR
@set VERSION=0.1
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
    echo    Offline Escalation Launcher
    echo.
    echo.
    TIMEOUT 1 >nul
    echo Made by: %AUTHOR%
    echo Version: %VERSION%
    echo.
    echo.
    TIMEOUT 1 >nul

:SAME_FOLDER_CHECK
    echo.
    @set /P SAME_FOLDER_CHECK_ANSWER=Did you place this batch file in the same folder as TWFC.exe? - y/n:
    echo.

    if %SAME_FOLDER_CHECK_ANSWER%==y (
        cls
        goto :SELECT_MAP
    ) else if %SAME_FOLDER_CHECK_ANSWER%==n (
        cls 
        goto :GETTING_DRIVE
    ) else (
        echo ERROR :: Unknown response, please try again
        goto :SAME_FOLDER_CHECK
    )

:GETTING_DRIVE
    echo.
    echo Type the drive letter that Transformers War For Cybertron is installed on.
    echo Example: C, D, E, etc. (This is case sensitive)
    echo.
    @set /P DRIVE_LETTER=
    %DRIVE_LETTER%:
    echo Drive changed

:GETTING_FILE_PATH
    echo.
    echo Type the full file path to Transformers War For Cybertron on your PC.
    echo Example: Steam\steamapps\common\Transformers War for Cybertron\Binaries
    echo.
    @set /P FILE_PATH=Your file path:

:CHECK_FILE_PATH
    if %FILE_PATH%==EXAMPLE (
        @set FILE_PATH=Steam\steamapps\common\Transformers War for Cybertron\Binaries
    )

    echo.
    echo %FILE_PATH%
    echo.
    @set /P FILE_PATH_ANSWER=Is the file path above correct? - y/n:

    if %FILE_PATH_ANSWER%==n (
        cls
        goto :GETTING_FILE_PATH
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

    echo.
    echo.
    echo --------------MAPS--------------
    echo            Broken Hope
    echo              Remnant
    echo --------------------------------
    echo.
    echo Please select a map from the list above.
    echo -- Type 1 for Broken Hope or 2 for Remnant
    echo.
    @set /P MAP_NAME=Map:

    if %MAP_NAME%==1 (
        @set MAP=%Broke%
        goto :RUN_GAME
    ) else if %MAP_NAME%==2 (
        @set MAP=%Rem%
        goto :RUN_GAME
    ) else (
        echo.
        echo ERROR :: Unknown response, please try again
        goto :SELECT_MAP
    )

:RUN_GAME
    echo Game is starting, please wait...
    twfc %MAP%?Game=TransContent.TnSurvivalGame?GameModeTag=SV?GameTeamStatus=2
    goto :END

:END
    cls
    echo.
    echo This window will now close automatically...
    TIMEOUT 2 >nul
    exit