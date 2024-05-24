awk -F"\t" '{for(i=1;i<=NF;i++){printf("mv Cycle_0_F%03d.tif Cycle_0_%03d_%03d.tif\n",  $i,i-1,NR-1)}}' wells.tsv
