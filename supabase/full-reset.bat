@echo off

rem Generate Snaplet
npx snaplet generate
if %ERRORLEVEL% NEQ 0 (
    echo Error generating Snaplet
    pause
    exit /b %ERRORLEVEL%
)

rem Generate SQL from TypeScript seed file
npx tsx seed.mts > seed.sql
if %ERRORLEVEL% NEQ 0 (
    echo Error generating SQL from seed file
    pause
    exit /b %ERRORLEVEL%
)

rem Reset Supabase database
supabase db reset
if %ERRORLEVEL% NEQ 0 (
    echo Error resetting Supabase database
    pause
    exit /b %ERRORLEVEL%
)

rem Generate Snaplet again (assuming it's necessary)
npx snaplet generate
if %ERRORLEVEL% NEQ 0 (
    echo Error generating Snaplet again
    pause
    exit /b %ERRORLEVEL%
)

rem Generate SQL from TypeScript TestUsers file
npx tsx TestUsers.mts > test_users.sql
if %ERRORLEVEL% NEQ 0 (
    echo Error generating SQL from TestUsers file
    pause
    exit /b %ERRORLEVEL%
)

rem Run SQL script using psql
psql "postgresql://postgres:postgres@localhost:54322/postgres" < test_users.sql
if %ERRORLEVEL% NEQ 0 (
    echo Error running SQL script
    pause
    exit /b %ERRORLEVEL%
)

echo Script executed successfully
pause
exit /b 0
