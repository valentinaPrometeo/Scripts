:: @echo off/on es para determinar si se mostrarán o no los comandos que escribimos.
@echo off 
:: EnableDelayedExpansion = Expansión retrasada es un parámetro que se pasa al SETLOCAL hará que las variables sean temporales mientras dure el script.
setlocal EnableDelayedExpansion

:: El siguiente comando permite leer (ingresar) el archivo de texto y guardar su contenido en una variable.
set /p IP=Introduce la IP estatica: 
set /p MASCARA=Introduce la mascara de red: 
set /p PUERTA=Introduce la puerta de enlace: 

:: echo permite mostrar el contenido de la variable en pantalla.
echo Configurando IP ...
:: netsh permite configurar la red con los datos ingresados anteriormente
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA%

:: echo permite mostrar el contenido de la variable en pantalla.
echo Configuracion aplicada
:: la pausa permite que el usuario vea el mensaje antes de que el script se cierre.
pause

:: El siguiente comando permite leer (ingresar) el archivo de texto y guardar su contenido en una variable
set /p ORIGEN=Ruta de origen para la copia:
:: El siguiente comando permite leer (ingresar) el archivo de texto y guardar su contenido en una variable
set /p DESTINO=Ruta de destino para la copia: 

:: Condicional simple para verificar si el usuario ingresó la ruta de destino sino deberá crearlo
if not exist "%DESTINO%" mkdir "%DESTINO%"

:: echo permite mostrar el contenido de la variable en pantalla.
echo Iniciando backup ...

:: Este comando lo que va a realizar con la herramienta de copia robusca como ROBOCOPY, es copiar los archivos de la ruta de origen a la ruta de destino definidas anteriormente
:: /E: es para copiar todos los archivos y subdirectorios
:: /Z: 
:: /NP: es para no mostrar el porcentaje de avance
:: /LOG+:log_admin.txt: es para crear un archivo de log con el nombre que se le indique
robocopy "%ORIGEN%" "%DESTINO%" /E /Z /NP /LOG+:log_admin.txt

:: En la lectura del script agrega una línea separadora 
echo --- >> log_admin.txt

:: Muestra las variables temporales en pantalla de fecha y hora
:: Luego el comando escribe en el archivo de log la configuración de red usando las varaibles obtenidas anteriormente
echo [%DATE% %TIME%] Configuracion red: IP=%IP%, MASK=%MASCARA%, GATEWAY=%PUERTA% >> log_admin.txt
echo [%DATE% %TIME%] Copia realizada de "%ORIGEN%" a "%DESTINO%" >> log_admin.txt

echo Operacion completada. Revisa el archivo log_admin.txt
pause