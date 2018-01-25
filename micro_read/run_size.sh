#!/bin/bash -l

OUTFILE=data/data_size

module load intel64/17.0up04
module load likwid
likwid-setFrequencies -f 2.4
likwid-setFrequencies --umin 2.4
make clean
make

rm -f $OUTFILE

#num elements, start at 
START=$((32))
STOP=$((34*1024*1024))
SAMPLES=32

BASE=`echo "e(l($STOP/$START)/$SAMPLES)" | bc -l`

for t in `seq 1 1`
do
	export OMP_NUM_THREADS=$t
	rm -f $OUTFILE$t

	for a in 64 4096
	do
		for reads in `seq 1 10`
		do
			for s in `seq 0 $SAMPLES`
			do
				nums=`echo "$START*$BASE^$s" | bc -l | xargs printf "%f\n"`
				#printf "%i " $t >> $OUTFILE$t
				echo $(likwid-pin -q -s 0x0 -c E:N:$t:1:2 ./read $nums $a $reads) >> $OUTFILE$t
				#echo $(./triad $nums) >> $OUTFILE$t
			done
		done
	done
done


