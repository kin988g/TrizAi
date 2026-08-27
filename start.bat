@echo off
chcp 65001 >nul
title TRIZ 智能体 - 本地服务器

echo ========================================
echo    TRIZ 智能体 - 本地部署版
echo ========================================
echo.

cd /d "%~dp0"

:: 检查Python是否可用
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [信息] 检测到 Python，使用 Python 启动服务器...
    echo [信息] 服务器地址: http://localhost:8080
    echo [信息] 按 Ctrl+C 停止服务器
    echo.
    start "" http://localhost:8080
    python -m http.server 8080
    goto :end
)

:: 检查Node.js是否可用
node --version >nul 2>&1
if %errorlevel% equ 0 (
    echo [信息] 检测到 Node.js，使用 npx serve 启动服务器...
    echo [信息] 服务器地址: http://localhost:3000
    echo [信息] 按 Ctrl+C 停止服务器
    echo.
    start "" http://localhost:3000
    npx serve -l 3000 .
    goto :end
)

:: 都没有的话，直接用浏览器打开
echo [警告] 未检测到 Python 或 Node.js
echo [信息] 将直接用浏览器打开 index.html
echo [提示] 如需更好的兼容性，请安装 Python 或 Node.js
echo.
pause
start "" index.html

:end
pause
