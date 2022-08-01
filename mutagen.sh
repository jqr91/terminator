#! /bin/bash

list=$(mutagen sync list | grep 'Identifier')

while IFS= read -r line; do
    identifier=$(echo "$line" | sed "s/Identifier://g" | tr -d ' ')
    if [ -z "$identifier" ]
        then
            echo "No synchronization sessions found"
        else
            echo "$identifier"
            echo $(mutagen sync terminate "$identifier")
    fi
done <<< "$list"

