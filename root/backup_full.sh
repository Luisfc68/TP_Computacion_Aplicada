#!/bin/bash
if [ "$1" == "-h" ]; then 
	


fi
if [ -d $1 ] && [ -d $2 ]; then 



	ENCONTRADO="/dev/shm/"`date +%N | md5sum | head -c -4`"1.temp"
	PID_ACTUAL="/dev/shm/"`date +%N | md5sum | head -c -4`"2.temp"
	PIDS_TOTALES="/dev/shm/"`date +%N | md5sum | head -c -4`"3.temp"
	
	find $1 > $ENCONTRADO 
	
	while read -r ARCH ; do
		
	# pueden haber varias entradas
 	# encontrados -> archivos todos los archivos encontrados en el directorio a backupear
	# pid_actual -> pids de los procesos que hacen uso del archivo que se esta analizando ahora
	# pids_totales -> pids de todos los procesos detenidos durante el backup

		fuser $ARCH 2> /dev/null | tr "[:space:]" "\n" | egrep "^[0-9]" > $PID_ACTUAL 
		while read -r PID ; do  # para no pausar init y que se muera todo
			if [ -n "$PID" ] && [ "$PID" != "1" ] && [ "$PID" != "$$" ] ; then
				echo $PID >> $PIDS_TOTALES
				kill -TSTP $PID && echo $PID detenido
			fi
		done < $PID_ACTUAL

	done < $ENCONTRADO


	NOMBRE=`echo $1 | tr -cd [:alpha:]`"_bkp_"`date +%Y%m%d`".tar.gz"

	tar -czf "$2/$NOMBRE" "$1" && echo completado

	while read -r PID ; do 
		kill -CONT $PID && echo $PID reanudado
	done < $PIDS_TOTALES

	rm $ENCONTRADO
	rm $PID_ACTUAL
	rm $PIDS_TOTALES

#	NOMBRE=`echo $1 | tr -cd [:alpha:]`"_bkp_"`date +%Y%m%d`".tar.gz"
	 
#	tar cvzf "$2/$NOMBRE" "$1" && echo completado
	
else
	echo "Uno de los parametros proporcionados no es un directorio" && exit 1
fi
