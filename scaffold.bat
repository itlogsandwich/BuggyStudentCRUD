@echo off
echo ==========================================
echo  BuggyStudentCRUD - Database Setup Script
echo ==========================================
echo.

cd /d "%~dp0BuggyStudentCRUD"

echo [1/3] Restoring NuGet packages...
dotnet restore
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to restore packages.
    pause
    exit /b 1
)
echo.

echo [2/3] Creating initial migration...
dotnet ef migrations add InitialCreate
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to create migration. Make sure dotnet-ef tool is installed.
    echo Run: dotnet tool install --global dotnet-ef
    pause
    exit /b 1
)
echo.

echo [3/3] Applying migration to database...
dotnet ef database update
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: Failed to update database.
    pause
    exit /b 1
)
echo.

echo ==========================================
echo  Database setup complete!
echo  Database: BuggyStudentCRUDDb (LocalDB)
echo ==========================================
pause
