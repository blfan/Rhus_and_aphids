source activate hifiasm
hifiasm -o HJS -t 120 --primary /data/blfan/wubeizi/Rhus2/hifisam/HJS/bc1021/HJS.hifi.fasta.gz

ref_file=/home/llchen/data/Rhus_chinensis_Mill/genome_analysis/QFY.genome.version1.fasta;
query_file=/data/blfan/wubeizi/Rhus2/hifisam/HJS/purge_dups/purged.fa;
correct_file=/data/blfan/wubeizi/Rhus2/hifisam/HJS/ragtag_output/ragtag.correct.fasta;
ragtag.py scaffold -t 120 $ref_file $correct_file

gmap_build -D ./gmap-db -d HJS ./ragtag_output_back/HJS.fa
gmap -D ./gmap-db -d HJS -t 12 -f 2 -n 1 /home/llchen/data/Rhus_chinensis_Mill/Annotation/V3/V3/QFY-anno/04.gene_predict/Gene/Rhus_potaninii.gene.cds.fa > ./HJS.gff