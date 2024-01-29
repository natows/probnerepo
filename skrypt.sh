#!/bin/bash
case $1 in
 -a)date;;
 -b)ls;;
 -c)$USER;;
 -d)
    read -p "podaj nazwe katalogu " nazwa
    mkdir $nazwa;;
 -e)
    read -p "podaj nzawe pliku ktory chcesz usunać " nazwa
    rm $nazwa;;
 -f)
    read -p "podaj nazwe pliku ktory chcesz ywswietlic" nazwa
    cat $nazwa | head -n 10;;
 -g)
    read -p "podaj nazwe pliku ktory chcesz ywswietlic" nazwa
    cat $nazwa | tail -n 10;;
 -h)echo "nie wiem";;
 -i)find . -maxdepth 1 -type f | wc -l;;
 -j)echo $(find . -maxdepth 1 -type f | grep -E "*.txt" );;
 -k)
    echo "MENU:"
    echo "1.Obliczenie sumy liczb od 1 do podanej"
    echo "2.Oczytanie i wyswietlenie zawartosci pliku w odwrotnej kolejności"
    echo "3.Sprawdzenie czy podana ściezka jest katalogiem czy plikiem"
    echo "4.Zlicz liczbe plikow i katalogow w biezacym katalogu"
    echo "5.Wyszukaj plik o podanej nazwie w bieżacym katalogu"
    read -p "wybierz opcje" n
    case $n in
    1) read -p "podaj liczbe" liczba
       suma=0
       for ((i=1;i<=$liczba;i++));do
       suma=$((suma+i))
       done
       echo $suma ;;
    2)read -p "podaj nazwe pliku" nazwa
      cat $nazwa | tac ;;
    3)read -p "podaj sciezke" sciezka
      if [[ -f $sciezka ]];then
      echo "Plik"
      elif [[ -d $sciezka ]];then 
      echo "Katalog"
      else
       echo "nie istnieje"
       fi ;;
    4)echo $(ls -a | wc -l );;
    5)read -p "podaj nazwe" nazwa
      echo $(ls -a | grep  -E ".*$nazwa" );;
    *)echo "zla opcja";;  

   esac;;
*) echo "zla opcja";;
esac  

