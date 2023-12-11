cat YFM_daibiao3.fa B1_daibiao3.fa HFY_daibiao3.fa QFY_daibiao3.fa HFY.fasta Pistacia.chinensis.fasta QFY.fasta Rhus_chinensis.fasta R.typhina.fasta HJS_daibiao3.fa GYQ_daibiao3.fa >tree.fa

mafft --thread 70 tree.fa > tree.phy
iqtree -s tree.phy -o Pistacia.chinensis -nt 70
