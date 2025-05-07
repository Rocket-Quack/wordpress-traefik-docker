@echo off
setlocal

:: Get absolute path to current script directory
set "SCRIPT_DIR=%~dp0"

echo %SCRIPT_DIR%

:: Build correct paths
set "TEMPLATE=%SCRIPT_DIR%.env.example"
set "TARGET=%SCRIPT_DIR%.env"
set "SETUP_ENV=%SCRIPT_DIR%scripts\setup-env.bat"

echo Starting Rocket-Quack WordPress Traefik setup...

:: If .env does not exist, copy and configure
if not exist "%TARGET%" (
    echo Create the .env by copying the example.
    echo Copying %TEMPLATE% to %TARGET%...
    copy "%TEMPLATE%" "%TARGET%" >nul

    if exist "%SETUP_ENV%" (
        echo Running interactive setup...
        call "%SETUP_ENV%"
    ) else (
        echo Error: %SETUP_ENV% not found or not executable.
        exit /b 1
    )

) else (
    echo %TARGET% already exists

    choice /M "Do you want to overwrite the existing .env file"
    if errorlevel 2 (
        echo Existing .env file is used
    ) else (
        echo Overwriting the existing .env file
        if exist "%SETUP_ENV%" (
            echo Running interactive setup...
            call "%SETUP_ENV%"
        ) else (
            echo Error: %SETUP_ENV% not found or not executable.
            exit /b 1
        )
    )
)

echo Environment setup complete
echo Preparing the engines to start docker

:: Start docker stack
echo Docker liftoff...
docker compose up -d

endlocal
