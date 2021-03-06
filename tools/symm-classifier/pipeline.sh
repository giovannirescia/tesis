#!/bin/bash

VAR_ANALYZER=run_var_analyzer.sh
VAR_STATS=pysrc/proc_var_analyzer_data.py
SYMM_CLASSIFIER=classify_symms.sh
IN_FOLDER=$1
OUT_FOLDER=$2
TIMEOUT=$3
AV_CORES=$4

OUT_FILE=$OUT_FOLDER/var_analyzer.txt
VAR_DATA=$OUT_FOLDER/vardata

./$VAR_ANALYZER $IN_FOLDER $OUT_FOLDER $AV_CORES

./$VAR_STATS $OUT_FILE -f $OUT_FOLDER

./$SYMM_CLASSIFIER $VAR_DATA $IN_FOLDER $OUT_FOLDER $AV_CORES