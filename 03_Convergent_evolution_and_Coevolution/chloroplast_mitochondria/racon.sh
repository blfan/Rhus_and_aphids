seqkit grep -v -r -p "ptg000027l_pilon_pilon|ptg000176l_pilon_pilon|ptg000137l_pilon_pilon" ../YFM.fa > YFM_contig27.fa
cat YFM_contig27.fa /data/blfan/wubeizi/chloroplast_mitochondria/chloroplast/YFM/Rhus_chinensis.fasta >YFM_ref.fa
bam2fasta /home/llchen/data/Rhus_chinensis_Mill/HiFi/BYFM-YFM-X101SC21043633-Z04-F001/Pacbio/01.HBWF-YFM2-LF-1/hifi/m64267e_210629_055626.hifi_reads.bam -o YFM.hifi -j 60
minimap2 -ax asm5 -t 120 YFM_ref.fa YFM.hifi.fasta.gz >YFM_input.sam
pileup.sh in=YFM_input.sam out=YFM_input.out
racon -t 120 YFM.hifi.fasta.gz YFM_input.sam YFM_ref.fa > YFM_prefix1.fa
seqkit grep -r -p "NC_033535.1" YFM_prefix1.fa > YFM_daibiao1.fa

minimap2 -ax asm5 -t 120 YFM_prefix1.fa YFM.hifi.fasta.gz >YFM_input2.sam
racon -t 120 YFM.hifi.fasta.gz YFM_input2.sam YFM_prefix1.fa > YFM_prefix2.fa
seqkit grep -r -p "NC_033535.1" YFM_prefix2.fa > YFM_daibiao2.fa

minimap2 -ax asm5 -t 120 YFM_prefix2.fa YFM.hifi.fasta.gz >YFM_input3.sam
racon -t 120 YFM.hifi.fasta.gz YFM_input3.sam YFM_prefix2.fa > YFM_prefix3.fa
seqkit grep -r -p "NC_033535.1" YFM_prefix3.fa > YFM_daibiao3.fa