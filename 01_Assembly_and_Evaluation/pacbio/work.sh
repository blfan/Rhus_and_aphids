bam="/home/llchen/data/Rhus_chinensis_Mill/HiFi/BYFM-YFM-X101SC21043633-Z04-F001/Pacbio/01.HBWF-YFM2-LF-1/hifi/m64267e_210629_055626.hifi_reads.bam"
name="YFM"
samtools sort -@70 $bam -o $name.sorted.bam

bedtools bamtofastq -i $name.sorted.bam -fq $name.fq

seqkit stat -a $name.fq >stat

minimap2 -ax map-hifi /home/llchen/data/Rhus_chinensis_Mill/Annotation/V3/V3/YFM/YFM.genome.version1.fasta YFM.fq >aln.sam
samtools view -@ 30 -bS aln.sam -o aln.bam
samtools sort -@ 30 aln.bam -o output.bam
samtools flagstat -@ 10 output.bam >output.aln
