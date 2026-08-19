@echo off
REM Sync reference slide from slides/ to GitHub Pages docs/demo/
copy /Y "%~dp0..\slides\deepseek-harness-v3.html" "%~dp0..\docs\demo\deepseek-harness-v3.html"
echo Synced docs/demo/deepseek-harness-v3.html
