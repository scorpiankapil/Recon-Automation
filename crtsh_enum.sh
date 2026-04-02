#!/bin/bash

read -p "Enter target domain: " target
read -p "Enter output file name (with .txt): " output

# .txt auto add
if [[ $output != *.txt ]]; then
    output="${output}.txt"
fi

echo "[+] Fetching subdomains for: $target ..."
sleep 1

curl -s -A "Mozilla/5.0" "https://crt.sh/?q=%25.${target}&output=json" | \
grep -oE '"name_value":"[^"]+"' | \
cut -d'"' -f4 | \
tr '\n' ',' | tr ',' '\n' | \
sed 's/\*\.//g' | \
tr '[:upper:]' '[:lower:]' | \
sort -u > "$output"

# check if empty
if [ ! -s "$output" ]; then
    echo "[-] No data found! crt.sh may be blocking or empty response."
else
    echo "[+] Done! Subdomains saved in: $output"
    echo "[+] Total subdomains: $(wc -l < "$output")"
fi