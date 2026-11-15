@echo off
chcp 936 >nul
title 博客本地预览
cd /d "%~dp0"

set "HUGO="
for /f "delims=" %%i in ('where hugo 2^>nul') do if not defined HUGO set "HUGO=%%i"
if not defined HUGO set "HUGO=C:\Users\Qinglan He\AppData\Local\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe\hugo.exe"
if not exist "%HUGO%" (
  echo 找不到 Hugo，请先安装：winget install Hugo.Hugo.Extended
  pause
  exit /b 1
)

echo ============================================
echo   博客本地预览
echo   地址：http://127.0.0.1:1313/
echo   关闭此窗口即停止服务
echo ============================================
echo.
echo 正在启动，稍后会自动打开浏览器...

start "" /min cmd /c "timeout /t 4 >nul && explorer http://127.0.0.1:1313/"
"%HUGO%" server --buildDrafts --bind 127.0.0.1 --port 1313

echo.
echo 服务已停止。
pause