@echo off
if not exist src mkdir src
if exist index.html move index.html src\index.html
echo Running docker compose...
docker compose up -d
if %errorlevel% neq 0 (
    echo Docker compose failed. Please check if docker is running.
    exit /b %errorlevel%
)
echo Verifying container...
timeout /t 5
curl http://localhost:8080
echo.
echo Setup complete. Access at http://localhost:8080