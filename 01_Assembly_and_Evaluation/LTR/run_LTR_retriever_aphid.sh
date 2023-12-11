#!/usr/bin/bash

genome=YFMYC.genome.version1.fna

gt suffixerator -db ../../${genome} -indexname ${genome} -tis -suf -lcp -des -ssp -sds -dna

gt ltrharvest -index ${genome} -minlenltr 100 -maxlenltr 7000 -mintsd 4 -maxtsd 6 -motif TGCA -motifmis 1 -similar 85 -vic 10 -seed 20 -seqids yes > ${genome}\.harvest.scn

perl /home/dxxu/Cassiva_project/XX048/Final_genome/LAI/LTR_FINDER_parallel-1.1/LTR_FINDER_parallel -seq ../../${genome} -threads 30 -harvest_out -size 1000000 -time 300


cat ${genome}\.harvest.scn ${genome}\.finder.combine.scn > ${genome}\.rawLTR.scn

LTR_retriever -genome ../../${genome} -inharvest ${genome}\.rawLTR.scn -threads 30 -u 2.7e-10

LAI -genome ../../${genome} -intact ${genome}\.pass.list -all ${genome}\.out 
