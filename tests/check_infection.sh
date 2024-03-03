#!/usr/bin/bash
# Reset
Color_Off='\033[0m'       # Text Reset

# Bold High Intensity
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green


 if [ "$#" -eq 0 ]; then
	printf "%s: usage: ./%s dir1 dir2 ... dirN\n" "$0" "$0"
 fi

 for arg in "$@"; do
	total_fil=($(find "$arg" -mindepth 1 -maxdepth 3 -type f | wc -l))
	infected_fil=($(find "$arg" -mindepth 1 -maxdepth 3 -type f -exec strings {} \; | grep "Famine version 1.0 (c)oded by mamaurai:xchalle - " | wc -l))
	_32fil=($(find "$arg" -mindepth 1 -maxdepth 3 -type f -exec file {} \; | grep "ELF 32-bit" | wc -l))
	_64fil=($(find "$arg" -mindepth 1 -maxdepth 3 -type f -exec file {} \; | grep "ELF 64-bit" | wc -l))

        printf "%-15s %-12s: ${BIGreen}[${total_fil}]${Color_Off}\n" "$arg" "Total files"
        printf "%-15s %-12s: ${BIGreen}[${_32fil}]${Color_Off}\n" "$arg" "32-Bit"
        printf "%-15s %-12s: ${BIGreen}[${_64fil}]${Color_Off}\n" "$arg" "64-Bit"
        printf "%-15s %-12s: ${BIGreen}[${infected_fil}]${Color_Off}\n" "$arg" "Infected"
done
