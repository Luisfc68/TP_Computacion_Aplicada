#!/bin/bash

DIR=$1

if [ "$1" == "-h" ]; then

	echo `basename $0` "<directorio a backupear> <directorio destino>" && exit 0 

elif [ $# -ne 2 ]; then  

	echo "Cantidad de argumentos equivocada" && exit 2

else
	# si los parametros cumplen los requisitos me aseguro que el directorio origen termine en /
	# ya que si no se vuelve loco
	if [ `echo $DIR | tail -c -2` != "/" ]; then  
		
		DIR=$DIR"/"
	
	fi

fi

if [ -d $DIR ] && [ -d $2 ]; then 
	
	LOG="/dev/shm/log$$.temp"
	NOMBRE=`echo $DIR | tr -cd [:alnum:]`"_bkp_"`date +%Y%m%d`".tar.gz"

	ENCONTRADO="/dev/shm/"`date +%N | md5sum | head -c -4`"1.temp"
	PID_ACTUAL="/dev/shm/"`date +%N | md5sum | head -c -4`"2.temp"
	PIDS_TOTALES="/dev/shm/"`date +%N | md5sum | head -c -4`"3.temp"
	
	touch {$ENCONTRADO,$PID_ACTUAL,$PIDS_TOTALES}
	
	find $DIR > $ENCONTRADO 
	
	while read -r ARCH ; do
		
	# pueden haber varias entradas
 	# encontrados -> archivos todos los archivos encontrados en el directorio a backupear
	# pid_actual -> pids de los procesos que hacen uso del archivo que se esta analizando ahora
	# pids_totales -> pids de todos los procesos detenidos durante el backup
		
		echo `date +%H:%M:%S`" - Backup $NOMBRE - $ARCH"  >> $LOG
		fuser $ARCH 2> /dev/null | tr "[:space:]" "\n" | egrep "^[0-9]" > $PID_ACTUAL 
		while read -r PID ; do  # para no pausar init y que se muera todo
			if [ -n "$PID" ] && [ "$PID" != "1" ] && [ "$PID" != "$$" ] ; then
				echo $PID >> $PIDS_TOTALES
				kill -TSTP $PID && echo $PID detenido
			fi
		done < $PID_ACTUAL

	done < $ENCONTRADO


	tar -czf "$2/$NOMBRE" "$DIR" && echo completado

	while read -r PID ; do 
		kill -CONT $PID && echo $PID reanudado
	done < $PIDS_TOTALES

	rm $ENCONTRADO
	rm $PID_ACTUAL
	rm $PIDS_TOTALES
	
	mail -s "Log backup" root < $LOG
	rm $LOG
	
else
	echo "Uno de los parametros proporcionados no es un directorio" && exit 1
fi
