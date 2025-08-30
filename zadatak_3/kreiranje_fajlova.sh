#!/bin/bash

INPUT_FILE="prilog.txt"

while read fname; do
  touch "$fname"
done < "$INPUT_FILE"

echo "Svi fajlovi iz liste su kreirani kao prazni fajlovi."

regex='^k[0-9a-fA-F]{8}\.kod$'

while read -r file; do
  file=$(echo "$file" | tr -d '\r')
  if ! [[ $file =~ $regex ]]; then
    echo "NEISPRAVAN: $file"
  fi
done < "$INPUT_FILE"

for file in *; do

  G="${file:5:1}"

  G_dec=$((16#$G))

  if (( G_dec % 2 == 0 )); then
    dir="${G}0/${file:6:1}0"
  else
    X=$((G_dec - 1))
    X_hex=$(printf "%x" $X)
    dir="${X_hex}0/${file:6:1}0"
  fi

  mkdir -p "$dir"

  mv "$file" "$dir/"
done