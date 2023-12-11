#jellyfish count -m 20  -t 70 /data/blfan/wubeizi/Rhus2/hifisam/GYQ/bc1020/GYQ.hifi.fasta -o reads.jf -s 100M
#jellyfish histo -t 70 reads.jf > reads.histo

jellyfish count -C -m 18 -s 1000M -t 70 /data/blfan/wubeizi/Rhus2/hifisam/GYQ/bc1020/GYQ.hifi.fasta -o kmer_counts.jf
jellyfish histo kmer_counts.jf > reads.histo



L=$(smudgeplot.py cutoff reads.histo L)
U=$(smudgeplot.py cutoff reads.histo U)
echo $L $U # these need to be sane values like 30 800 or so
jellyfish dump -c -L $L -U $U kmer_counts.jf | smudgeplot.py hetkmers -o kmer_pairs
# note that if you would like use --middle flag, you would have to sort the jellyfish dump first

smudgeplot.py plot kmer_pairs_coverages_2.tsv -o my_genome
