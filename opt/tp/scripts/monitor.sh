#!/bin/bash
#Si el argumento es -h, imprimir la ayuda.
if [ "$1" == "-h" ]; then 

	echo  " `basename $0` <nombre del proceso a verificar>" && exit 0
#Si la cantidad de argumentos es distinta de 1, imprimir error
elif [ $# -ne 1 ]; then

	echo "Cantidad de argumentos invalida, use -h para ver ayuda" && exit 2

fi
#Verifica que los servicios correspondientes esten corriendo y en caso contrario notifica
RUTA=`which $1`
if [ -n "$RUTA" ]; then 
	
	PROCESO=`pgrep -x $1`
	if [ -n "$PROCESO" ]; then
		echo "Proceso "$1" activo" 
	else
		echo "El proceso no esta activo, notificando root..."
		echo "El proceso $1 no se encuentra funcionando, por favor arreglar" | mail -s "Proceso inactivo" root && echo "Root notificado" 
	fi
	exit 0	

else
	echo "El proceso $1 no se encuentra en el sistema" && exit 1
fi
