#!/bin/bash

#Si el script tira errores por duplicado de que no existe el proceso, este error se puede ignorar.
#Este error se ocaciona cuando un proceso se finaliza en el medio de la ejecucion del script.

DIR=$1

if [ "$1" == "-h" ]; then

	echo `basename $0` "<directorio a backupear> <directorio destino>" && exit 0 

elif [ $# -ne 2 ]; then  

	echo "Cantidad de argumentos equivocada" && exit 2

else
	# si los parametros cumplen los requisitos me aseguro que el directorio origen termine en /
	# ya que si no se vuelve loco
	
	MP1=`df $DIR | tail -1 | awk '{print $6}'`
	MP2=`df $DIR | tail -1 | awk '{print $6}'`
	echo $MP1 $MP2
	if [ `echo $DIR | tail -c -2` != "/" ]; then  
		
		DIR=$DIR"/"
	
	fi

fi
#verifica directorios y mp
if [ -d $DIR ] && [ -d $2 ] && [ `mountpoint -q $MP1 && echo ok` != "" ] && [ `mountpoint -q $MP2 && echo ok` != "" ] ; then 
	
	LOG="/tmp/log$$.temp"
	NOMBRE=`echo $DIR | tr -cd [:alnum:]`"_bkp_"`date +%Y%m%d`".tar.gz"

	#crea archivos temporales de diferentes nombres por si se ejecuta varias veces el script
	ENCONTRADO="/tmp/"`date +%N | md5sum | head -c -4`"1.temp"
	PID_ACTUAL="/tmp/"`date +%N | md5sum | head -c -4`"2.temp"
	PIDS_TOTALES="/tmp/"`date +%N | md5sum | head -c -4`"3.temp"
	
	touch {$ENCONTRADO,$PID_ACTUAL,$PIDS_TOTALES}
	
	find $DIR > $ENCONTRADO 
	
	while read -r ARCH ; do
		
	# pueden haber varias entradas

 	# encontrados -> archivos todos los archivos encontrados en el directorio a backupear
	# pid_actual -> pids de los procesos que hacen uso del archivo que se esta analizando ahora
	# pids_totales -> pids de todos los procesos detenidos durante el backup
	
	#revisa los procesos en ejecucion que interactuen con los archivos a backupear y les pone pasua
	#luego reanuda
	
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
	echo "Uno de los parametros proporcionados no es un directorio o no esta montado" && exit 1
fi
