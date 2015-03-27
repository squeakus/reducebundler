#!/bin/bash

rm -rf visualize2 2> /dev/null
mkdir visualize2

if [ $# -eq 0 ]
  then
    echo "We don't want to use all the images, only every nth one, please specify n"
    exit 1
fi

#copy every n image to visualise2:
n=$1; 
counter=0;
imgcnt=0;
for file in visualize/*.[jJ][pP][gG]; do
    if [ $(($counter % $n)) -eq "0" ]; then
        echo "copying $file"
	cp $file visualize2
	let imgcnt=imgcnt+1;
    fi
    let counter=counter+1
done
echo "Images:$imgcnt"

# now reorder the images
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

# create a new list file
ls visualize2/*.jpg > list2.txt

# Trim the bundler file and create a new file
# Only take coords for every nth image and ignore the points
echo "# Bundle file v0.3" > bundle2.rd.out
echo "$imgcnt 0" >> bundle2.rd.out

START=1
END=$imgcnt
for (( c=$START; c<=$END; c++ ))
do
    let image=(c-1)*n
    let linestart=image*5 # five lines used for every image
    let linestart=linestart+3 #for the initial 3 lines
    let lineend=linestart+4
    echo "copying coords for image $c line $linestart lineend $lineend"
    sed -n "$linestart,$lineend p" bundle.rd.out >> bundle2.rd.out
done 
