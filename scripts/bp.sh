#!/bin/bash

if [ -f ~/.bash_profile ]
then
    source ~/.bash_profile
fi

#echo `python2.7 ../sy4ncl/scripts/proc_bliss.py`
mkdir -p output/bliss-proc-output
cd output/bliss-output/
echo ""
echo "----------------------------"
echo ""
echo "Doing the Bliss Proc thing..."
echo ""

echo "" > ../general_info/bliss-proc.txt
n=$(ls -1  | wc -l)
i=1
echo "" > ../general_info/bliss-proc-stats.txt
for f in ./*; do
    echo "$i / $((n)): $f"
    raw=$(echo `basename "$f" .stats`);
    ext=$(echo ".map");
    ext2=$(echo "_bliss_proc_.info");
    a=$(($(gdate +%s%N)/1000000));
    echo `python2.7 ../../tools/sy4ncl/scripts/proc_bliss.py "$f" ../syncl-output/$raw$ext` >> ../general_info/bliss-proc-stats.txt;
    b=$(($(gdate +%s%N)/1000000));
    echo "$a $b $raw" | awk '{printf ""$3"; %.3f secs\n", ($2-$1)/1000}' >> ../general_info/bliss-proc.txt;
    i=$((i+1));
    mv *.symm ../bliss-proc-output;
done
