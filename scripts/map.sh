#!/bin/bash

# run this from parent dir
mkdir -p output/final-output
cd output/mappings
echo ""
echo "----------------------------"
echo "Mapping back..."
echo ""

for f in ./*.mapping; do
    raw=$(echo `basename $f .mapping`);
    ext=$(echo ".symm");
    scala ../../scripts/mapper.scala "$f" ../bliss-proc-output/"$raw$ext" > ../final-output/$raw;
done

echo ""
