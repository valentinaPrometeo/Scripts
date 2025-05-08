:: WHILE Y FOR

::@echo off
::setlocal enabledelayedexpansion

::set /a contador=0
:::while_loop
::if %contador% lss 5 (
    ::echo Contador: %contador%
    ::set /a contador+=1
    ::goto :while_loop
::)

@echo off
setlocal enabledelayedexpansion

:pedir 
set /p entrada=Escribe "salir" para terminar:

if /i not "%entrada%"=="salir" (
    echo No macho, asi no sales ...
    goto :pedir
)

echo Saliendo del bucle ...
pause