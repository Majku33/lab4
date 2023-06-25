#!/bin/bash 

 

show_help() { 

    echo "Użycie: skrypt.sh [OPCJE]" 

    echo "Opcje:" 

    echo "  --help ,-h       Wyświetla pomoc" 

    echo "  --data  ,-d      Używa dzisiejszej daty" 

    echo "  --logs100 ,-l    Tworzy 100 plików z logami" 

    echo "  --logs30 ,-l30  Tworzy N plików z logami" 

    echo "                (domyślnie N = 30)" 

} 

 

create_log_file() { 

    local num_plikow=$1 

    for ((i=1; i<=num_plikow; i++)); do 

        nazwa_pliku="log${i}.txt" 

        dzisiaj=$(date +"%Y-%m-%d") 

        echo "Nazwa pliku: $nazwa_pliku" > "$nazwa_pliku" 

        echo "Nazwa skryptu: skrypt.sh" >> "$nazwa_pliku" 

        echo "Data utworzenia: $dzisiaj" >> "$nazwa_pliku" 

    done 

} 

 

if [[ $1 == "--help" | "-h" ]]; then 

    show_help 

else 

    echo "Nieznana opcja. Użyj --help, aby wyświetlić pomoc." 

fi 
