@echo off
REM Sync reference slide from slides/ to GitHub Pages docs/
set SRC=%~dp0..\slides\deepseek-harness-v3.html
copy /Y "%SRC%" "%~dp0..\docs\demo\deepseek-harness-v3.html"
copy /Y "%SRC%" "%~dp0..\docs\demo.html"
echo Synced docs/demo.html and docs/demo/deepseek-harness-v3.html
