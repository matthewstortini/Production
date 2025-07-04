#!/bin/bash
DATASET="$1"; 
OUTPUT=$(samweb list-files --summary "dh.dataset $DATASET" 2>/dev/null); 
FILE_COUNT=$(echo "$OUTPUT" | grep "File count:" | awk "{print \$3}"); 
TOTAL_SIZE=$(echo "$OUTPUT" | grep "Total size:" | awk "{print \$3}"); 
echo $((TOTAL_SIZE / FILE_COUNT / 1024 / 1024))
