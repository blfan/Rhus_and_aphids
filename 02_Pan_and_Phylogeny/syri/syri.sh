# using minimap2 for generating alignment. Any other whole genome alignment tool can also be used.
minimap2 -ax asm5 --eqx refgenome qrygenome > out.sam


seqkit grep -f Chr /home/llchen/data/Rhus_chinensis_Mill/Annotation/V3/V3/YFM/YFM.genome.version1.fasta >YFM.fa
seqkit grep -f Chr /home/llchen/data/Rhus_chinensis_Mill/Annotation/V3/V3/B1/B1.genome.version1.fna >B1.fa

minimap2 -ax asm5 -t 120 --eqx YFM.fa B1.fa > YFM_B1.sam

python3 ~/miniconda3/envs/syri/bin/syri -c YFM_B1.sam -r YFM.fa -q B1.fa -k -F S

#python3 ~/miniconda3/envs/syri/bin/plotsr syri.out YFM.fa B1.fa -H 8 -W 5
python3 ~/miniconda3/envs/syri/bin/plotsr --sr syri.out --genomes genomes.txt -o plotsr.png

