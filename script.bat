@echo off
set /p edad= introduce ti edad:
if %edad% GEQ 18 (
    echo Eres mayor de edad y MUY GUAPO
) else (
    echo Eres menor de edad, FUERA DE AQUI!
)
PAUSE