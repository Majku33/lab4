if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  echo "Dostępne opcje:"
  echo "--logs (-l): tworzy pliki logx.txt, x – numer pliku od 1 – 100, zawierające nazwę pliku, nazwę skryptu i datę"
  echo "--date (-d): wyświetla dzisiejszą datę"
  echo "--init: klonuje całe repozytorium do katalogu, ustawia ścieżkę w zmiennej PATH"
  echo "--error <liczba> (-e <liczba>): tworzy errorx/errorx.txt, liczba określa liczbę plików (domyślnie 100)"
else
  if [[ "$1" == "--logs" || "$1" == "-l" ]]; then
    if [[ "$2" =~ ^[0-9]+$ ]]; then
      count=$2
    else
      count=100
    fi

    for ((i=1; i<=$count; i++)); do
      filename="log$i.txt"
      echo "Nazwa pliku: $filename" >> "$filename"
      echo "Nazwa skryptu: $0" >> "$filename"
      echo "Data utworzenia: $(date '+%Y-%m-%d')" >> "$filename"
    done

  elif [[ "$1" == "--date" || "$1" == "-d" ]]; then
    date '+%Y-%m-%d'

  elif [[ "$1" == "--init" ]]; then
    git clone https://github.com/https://github.com/Majku33/lab4
    export PATH=$PATH:$(pwd)/repo

  elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
    if [[ "$2" =~ ^[0-9]+$ ]]; then
      count=$2
    else
      count=100
    fi

    for ((i=1; i<=$count; i++)); do
      dirname="error$i"
      filename="error$i.txt"
      mkdir -p "$dirname"
      echo "Nazwa pliku: $filename" >> "$dirname/$filename"
      echo "Nazwa skryptu: $0" >> "$dirname/$filename"
      echo "Data utworzenia: $(date '+%Y-%m-%d')" >> "$dirname/$filename"
    done

  else
    echo "Nieznana opcja. Dostępne opcje: --logs (-l), --date (-d), --init, --error <liczba> (-e <liczba>), --help (-h)"
  fi
fi

# Zmodyfikuj .gitignore, aby ignorować pliki zawierające "log" lub "error"
echo "*log*" >> .gitignore
echo "*error*" >> .gitignore

# Wyświetlenie wszystkich dostępnych opcji
echo "Wszystkie dostępne opcje:"
echo "--logs (-l): tworzy pliki logx
