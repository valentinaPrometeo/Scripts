@echo off
setlocal enabledelayedexpansion
for /F "tokens=3 delims=," %%a in (archivo.csv) do (
    set "linea=%%a"
    echo la primera linea del archivo.txt es : !linea!
)
pause

