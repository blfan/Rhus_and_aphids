bwa index genome.fasta
python ~/software/juicer/misc/generate_site_positions.py DpnII genome genome.fasta
awk 'BEGIN{OFS="\t"}{print $1, $NF}' genome_DpnII.txt > genome.chrom.sizes

~/software/juicer/scripts/juicer.sh -g YFM -D /home/blfan/software/juicer -z ./ref/genome.fasta -y ./ref/genome_DpnII.txt -p ./ref/genome.chrom.sizes -s DpnII -t 31
#~/software/3d-dna-master/run-asm-pipeline.sh -r 0 ./ref/genome.fasta ./aligned/merged_nodups.txt
bwa mem -t 31 ./ref/genome.fasta /home/llchen/data/Rhus_chinensis_Mill/Illumina/clean/HBWF-YFM2-LF-1/FDES210002323-1r_M124_1_clean.rd.fq.gz /home/llchen/data/Rhus_chinensis_Mill/Illumina/clean/HBWF-YFM2-LF-1/FDES210002323-1r_M124_2_clean.rd.fq.gz |samtools sort -@ 10 -o output.bam
samtools flagstat -@ 10 output.bam >output.aln