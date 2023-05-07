#!/opt/conda/bin/bash

PID=$1
intv=$2

#Umweg, hatte zuerst pgrep genutzt um nach pname zu suchen, aber so ist einfacher
#if ps -p $PID > /dev/null
#then
 #   pname=$(ps -p $PID -o comm=)
#else
 #   echo "Invalid PID"
  #  exit 1
#fi

#echo The programms name is : $pname


#basic while true loop until programm is stopped which checks if program is running 
while true; do
    if ps -p $PID > /dev/null #discards output, if process is running returns true
    then
        echo "Running"
    else
        echo "Stopped"
    fi
    sleep $intv
done