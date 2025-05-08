@echo off
setlocal EnableDelayedExpansion
set "origen=C:\Users\Alumno\Desktop\SCripts"
set "destino=C:\Users\Alumno\Desktop\copias_respaldo_documentos"
set contador=1
rem Crea el directorio destino si no existe
if not exist "%destino%" mkdir "%destino%"
rem Recorre los archivos .txt del origen
for %%F in (%origen%\*.txt) do (
    copy "%%F" "%destino%\copia_!contador!.txt"
    echo Copiado: %%F como copia_!contador!.txt
    set /a contador+=1
    if !contador! gtr 5 goto :fin
)
:fin
pause
endlocal