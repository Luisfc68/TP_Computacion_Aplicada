#Esto es un script que utilizamos al principio para solucionar el problema de red
#Que teniamos. No lo borramos por si queria leerlo.
ifconfig ens18 192.168.9.64 netmask 255.255.255.0 up
route add default gw 192.168.9.2
