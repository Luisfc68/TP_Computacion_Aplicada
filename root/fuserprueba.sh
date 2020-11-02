
find $1 > encontrado.txt 

while read -r ARCH ; do 
	
	fuser $ARCH 

done < encontrado.txt
