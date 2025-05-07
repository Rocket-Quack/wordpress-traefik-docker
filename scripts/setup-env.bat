@echo off
set "ENV_FILE=.env"

echo Generating .env file...
type nul > "%ENV_FILE%"

:: === Prompting user for configuration values ===
call :prompt LETSENCRYPT_EMAIL "Enter email for Let's Encrypt" "admin@example.com"
call :prompt DOMAIN_NAME "Enter your main domain (without www)" "example.com"
call :prompt TRAEFIK_DASHBOARD "Enable Traefik dashboard? (true/false)" "false"

echo. 
echo ##############################
echo ### DATABASE CONFIGURATION ###
echo ##############################
call :prompt DB_NAME "Database name" "wordpress"
call :prompt DB_USER "Database user" "wpuser"
call :prompt DB_PASSWORD "Database password" "wppassword"
call :prompt DB_ROOT_PASSWORD "Database root password" "rootpass"

echo.
echo #########################
echo ### VOLUME DEFINITION ###
echo #########################
call :prompt VOLUME_BASE_PATH "Base path for volumes" "/docker/volumes"
call :prompt WORDPRESS_CONTENT_PATH "WordPress content path" "wordpress/wp-content"
call :prompt DB_DATA_PATH "MariaDB data path" "database/db-data"

echo.
echo .env file created successfully.
goto :eof

:: === Function to prompt with default value ===
:prompt
setlocal
set "VAR_NAME=%~1"
set "PROMPT_TEXT=%~2"
set "DEFAULT_VALUE=%~3"

set /p "INPUT=%PROMPT_TEXT% [%DEFAULT_VALUE%]: "
if "%INPUT%"=="" set "INPUT=%DEFAULT_VALUE%"
>> "%ENV_FILE%" echo %VAR_NAME%=%INPUT%
endlocal
goto :eof
