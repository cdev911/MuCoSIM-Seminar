#!/bin/bash

OUTFILE=data/data_size

make clean
make

#rm -f $OUTFILE

#num elements, start at 
#end at 34M*8B = 272MB -> 272MB*4arrays=1GB of RAM at double precision (8B)
START=$((16))
STOP=$((34*1024*1024))
SAMPLES=32

BASE=`echo "e(l($STOP/$START)/$SAMPLES)" | bc -l`

for t in `seq 1 10`
do
	rm -f $OUTFILE$t
	for s in `seq 0 $SAMPLES`
	do
		nums=`echo "$START*$BASE^$s" | bc -l | xargs printf "%f\n"`
		printf "%i" $t >> $OUTFILE$t
		echo $(./mycode $nums) >> $OUTFILE$t
	done
done

