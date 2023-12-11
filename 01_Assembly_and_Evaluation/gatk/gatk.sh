
ref=/data/blfan/wubeizi/gatk/CFY/YFM.fa
fq1=/home/llchen/data/Rhus_chinensis_Mill/Illumina/clean/HBWF-YFM2-LF-1/FDES210002323-1r_M124_1_clean.rd.fq.gz
fq2=/home/llchen/data/Rhus_chinensis_Mill/Illumina/clean/HBWF-YFM2-LF-1/FDES210002323-1r_M124_2_clean.rd.fq.gz

bwa mem -R '@RG\tID:YFM_R1\tSM:YFM\tLB:R1\tPL:Illumina' -t 70 $ref $fq1 $fq2 > aligned.sam
samtools view -bS aligned.sam | samtools sort - -o aligned_sorted.bam

source activate gatk
gatk MarkDuplicates -I aligned_sorted.bam -O dedup.bam -M metrics.txt
samtools index dedup.bam

gatk HaplotypeCaller -R $ref -I dedup.bam -O raw_variants.vcf
