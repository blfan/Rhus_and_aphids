nucmer  -g 1000 -c 90 -l 40 -t 120 -p QFYYC3 /data/blfan/wubeizi/chloroplast_mitochondria/mitochondria/download/Kaburagia_rhusicola_ovogallis.fasta ../QFYYC_daibiao3.fa
delta-filter -r -q  -l 1000 QFYYC3.delta >QFYYC3.delta.filter
show-coords -TrHcl QFYYC3.delta.filter >QFYYC3.delta.filter.coords 
show-snps -C -T -r -l -x 1 QFYYC3.delta.filter > QFYYC3.delta.filter.snps