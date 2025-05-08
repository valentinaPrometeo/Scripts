@echo off
set /p nombreUsuario=Introduce tu nombre de usuario: 
set /p password=Introduce tu contraseña: 

net user %nombreUsuario% %password% /add
echo El usuario %nombreUsuario% ha sido creado con exito.
pause
set /p AgregarGrupo=Quieres ser agregado a un grupo? (s/n): 
if  "%AgregarGrupo%"=="s" (
    set /p grupoLocal= Que grupo?:  
    net localgroup '%grupoLocal%' %nombreUsuario% /add
) else (
    echo No ha sido agregado a ningun grupo
)
pause