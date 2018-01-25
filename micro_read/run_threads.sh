#!/bin/bash -l

OUTFILE=data/data_threads

module load intel64
module load likwid
make clean
make

#rm -f $OUTFILE

#num elements, start at 
#end at 34M*8B = 272MB -> 272MB*4arrays=1GB of RAM at double precision (8B)
#START=$((16))
STOP=$((34*1024*1024))
#SAMPLES=16

BASE=`echo "e(l($STOP/$START)/$SAMPLES)" | bc -l`

for s in `seq 0 0`
do
	#nums=`echo "$START*$BASE^$s" | bc -l | xargs printf "%f\n"`
	nums=$STOP
	rm -f $OUTFILE$s
	echo "\"array size: $nums\"" >> $OUTFILE$s

	for t in `seq 1 20`
	do
		#export OMP_NUM_THREADS=$t
		printf "%i " $t >> $OUTFILE$s
		echo $(likwid-pin -q -s 0x0 -c E:N:$t:1:2 ./read $nums) >> $OUTFILE$s
	done
done


