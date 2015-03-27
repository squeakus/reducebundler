#!/bin/bash

rm -rf visualize2 2> /dev/null
mkdir visualize2

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

#copy every x image:
x=$1; 
counter=0;
imgcnt=0;
for file in visualize/*.[jJ][pP][gG]; do
    if [ $(($counter % $x)) -eq "0" ]; then
        echo "copying $file"
	cp $file visualize2
	let imgcnt=imgcnt+1;
    fi
    let counter=counter+1
done
echo "Images:$imgcnt"

# #reorder the images
# COUNTER=0
# cd visualize2
# for file in *.[jJ][pP][gG]; do
#     newname="`printf %08d $COUNTER`.jpg"
#     if [ "$file" = "$newname" ]; then
#         echo "newnames are identical!" 
#     else
#         #echo "Renaming $file as $newname"
#         mv $file $newname
#     fi
#     let COUNTER=COUNTER+1
# done
# cd ..

#make new list file
ls visualize2/*.jpg > list2.txt

#({image number} +1)*5 + 2 in my example
#(4+1)*5+3 = 28
