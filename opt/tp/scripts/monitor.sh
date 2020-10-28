#!/bin/bash

RUTA=`which $1`
if [ -n "$RUTA" ]; then 
	
	PROCESO=`pgrep -x $1`
	if [ -n "$PROCESO" ]; then
		echo "Proceso "$1" activo" 
	else
		echo "El proceso no esta activo, notificando root..."
		echo "El proceso $1 no se encuentra funcionando, por favor arreglar" | mail -s "Proceso inactivo" root
		echo "Root notificado" 
	fi
	exit 0	

else
	echo "El proceso no se encuentra en el sistema" && exit 1
fi
