#!/bin/bash 

 

while [[ $# -gt 0 ]]; do 

    key="$1" 

    case $key in 

        --date) 

            date_flag=true 

            ;; 

        *) 

            echo "Nieznana opcja: $key" 

            exit 1 

            ;; 

    esac 

    shift 

done 

 

if [ "$date_flag" = true ]; then 

    dzisiaj=$(date +"%Y-%m-%d") 

    echo "Dzisiaj jest: $dzisiaj" 

fi 
