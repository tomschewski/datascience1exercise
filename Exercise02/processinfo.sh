#!/opt/conda/bin/bash

args=("$@") 

PID=${args[0]}
intv=${args[1]}

#Umweg, hatte zuerst pgrep genutzt um nach pname zu suchen, aber so ist einfacher
#if ps -p $PID > /dev/null
#then
 #   pname=$(ps -p $PID -o comm=)
#else
 #   echo "Invalid PID"
  #  exit 1
#fi

#echo The programms name is : $pname

while true; do
    if ps -p $PID > /dev/null
    then
        echo "Running"
    else
        echo "Stopped"
    fi
    sleep $intv
done