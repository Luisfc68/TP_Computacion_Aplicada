#!/bin/bash

esLaborable(){

	if [ "$1" == "-h" ]; then
		echo `basename $0` "<fecha a validar> (se recomienda formato yyyymmdd)" && exit 0
	
	elif [ $# -ne 1 ]; then 
	
		echo "Cantidad de argumentos equivocada" && exit 2

	fi
	#------reviso si la fecha ingresada es valida--------------
	date -d "$1" +%Y%m%d > /dev/null 2>&1
	
	if [ $? -ne 0 ]; then
		 echo "Formato de la fecha incorrecto" && exit 1  
	fi


	#-----guardo en una variable la fecha ingresada y la formateo en yyyymmdd y veo si en el archivo------
	#-----de fechas hay algun feriado inamovible con esa fecha-----
	FECHA=`date -d "$1" +%Y%m%d`
	MOTIVO=`echo "$FECHA" | egrep ^$(tail -c5) fechas.txt | tr ":" "\n" | tail -n1`



	#-----si encontro algo es un feriado inamovible----
	if [ -n "$MOTIVO" ];
	then
		echo $MOTIVO
		exit 0
	

	#-----si no encontro nada reviso los feriados movibles y la semana santa----
	else
		egrep ^t fechas.txt > /tmp/.fechas_temp.txt
		while read -r LINEA ; do
			
	#---calculo segun la fehca de ese feriado que dia cae en el año de la fecha introducida----

			FECHA_TRASLADADA=`echo "$FECHA" | head -c4 ``echo $LINEA | tr ":" "\n" | head -n1 | tr -d "t"`
			MOTIVO=`echo $LINEA | tr ":" "\n" | tail -n1`
			DIA_SEMANA=`date -d $FECHA_TRASLADADA +%w`
		
			case "$DIA_SEMANA" in 
				2) FECHA_TRASLADADA=`date -d "$FECHA_TRASLADADA-1 days" +%Y%m%d`;;
				3) FECHA_TRASLADADA=`date -d "$FECHA_TRASLADADA-2 days" +%Y%m%d`;;
				4) FECHA_TRASLADADA=`date -d "$FECHA_TRASLADADA+4 days" +%Y%m%d`;;
				5) FECHA_TRASLADADA=`date -d "$FECHA_TRASLADADA+3 days" +%Y%m%d`;;

			# reformateo la fecha porque si no no la toma el if 

				*)FECHA_TRASLADADA=`date -d "$FECHA_TRASLADADA" +%Y%m%d`;;
			esac
	#-----si la fecha calculada es igual a la introducida entonces es un feriado movible y me voy del script-----
			if [ "$FECHA" == "$FECHA_TRASLADADA" ]; then
				echo $MOTIVO
				rm /tmp/.fechas_temp.txt
				exit 0
			fi
		done < /tmp/.fechas_temp.txt


	# hago esta validacion aparte porque el calculo de semana santa y carnaval depende
	# de los ciclos lunares de cada año, por lo que me anote los inicios de SS hasta
	# el 2030 y con esos calculo las demas fechas

		egrep ^ss fechas.txt | tr -d "s" > /tmp/.fechas_temp.txt
		ENCONTRADO=false
		while read -r INICIO_SS ; do
				
	
			if [ "$FECHA" == "`date -d "$INICIO_SS +4 days" +%Y%m%d`" ]; then
				echo Jueves Santo.
				ENCONTRADO=true

			elif [ "$FECHA" == "`date -d "$INICIO_SS +5 days" +%Y%m%d`" ]; then
				echo Viernes Santo.
				ENCONTRADO=true

			elif [ "$FECHA" == "`date -d "$INICIO_SS -40 days" +%Y%m%d`" ]; then
				echo Martes de carnaval.
				ENCONTRADO=true

			elif [ "$FECHA" == "`date -d "$INICIO_SS -41 days" +%Y%m%d`" ]; then
				echo Lunes de carnaval.
				ENCONTRADO=true
			fi

			if $ENCONTRADO ; then 
				rm /tmp/.fechas_temp.txt
				exit 0
			fi
 
		done < /tmp/.fechas_temp.txt

	rm /tmp/.fechas_temp.txt

	fi
#----si en ninguna de las revisiones anteriores se salio del script entonces es un dia normal-----
	echo "Dia laborable"
	exit 0

}	
