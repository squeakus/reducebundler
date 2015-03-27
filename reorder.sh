#!/bin/bash
COUNTER=0
cd visualize2
for file in *.[jJ][pP][gG]; do
    newname="`printf %08d $COUNTER`.jpg"
    if [ "$file" = "$newname" ]; then
        echo "newnames are identical!" 
    else
        echo "Renaming $file as $newname"
        mv $file $newname
    fi
    let COUNTER=COUNTER+1
done
cd ..

ls visualize2/*.jpg > list2.txt
