#!/bin/bash

OUTFILE=dataRyzen/data_size

module load intel64
module load likwid
make clean
make

#rm -f $OUTFILE

#num elements, start at 
#end at 34M*8B = 272MB -> 272MB*4arrays=1GB of RAM at double precision (8B)
START=$((8))
STOP=$((34*1024*1024))
SAMPLES=64

BASE=`echo "e(l($STOP/$START)/$SAMPLES)" | bc -l`

for t in `seq 1 10`
do
	export OMP_NUM_THREADS=$t
	rm -f $OUTFILE$t

	for s in `seq 0 $SAMPLES`
	do
		nums=`echo "$START*$BASE^$s" | bc -l | xargs printf "%f\n"`
		printf "%i " $t >> $OUTFILE$t
		echo $(likwid-pin -q -s 0x0 -c E:N:$t:1:2 ./triad_simple $nums) >> $OUTFILE$t
	done
done


