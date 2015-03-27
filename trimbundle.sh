#!/bin/bash
imgcnt=776

#what was the image offset
offset=3
echo "# Bundle file v0.3" > bundle2.rd.out
echo "$imgcnt 0" >> bundle2.rd.out

START=1
END=$imgcnt
for (( c=$START; c<=$END; c++ ))
do
    let image=(c-1)*offset
    let linestart=image*5 # five lines used for every image
    let linestart=linestart+3 #for the initial 3 lines
    let lineend=linestart+4
    echo "copying coords for image $c line $linestart lineend $lineend"
    sed -n "$linestart,$lineend p" bundle.rd.out >> bundle2.rd.out
done 



#for each image we will paste the relevant 5 lines
#({image number} +1)*5 + 2 in my example
#(4+1)*5+3 = 28
