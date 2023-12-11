genome=YFM.genome.version1.fasta
name=YFM

perl /home/dxxu/EDTA-2.0.1/EDTA.pl --genome /home/llchen/data/Rhus_chinensis_Mill/Annotation/HFY_B1.genome.version2/YFM_B1_HFY.gff.version3/${genome} --anno 1 --overwrite 1 --sensitive 1 -t 20 --force 1
