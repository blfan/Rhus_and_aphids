jellyfish count -m 25  -t 16 /home/rpzhao/mushu/data/2dai/1.fq /home/rpzhao/mushu/data/2dai/2.fq  -o reads.jf
jellyfish histo -t 16 reads.jf > reads.histo
genomescope2 -i reads.histo -o g-25 -k 25 -p 4/2


jellyfish count -m ${k} -s 10G -t 64 -C -o jellyfish_${k}.jf merged.fq
jellyfish histo -t 32 jellyfish_${k}.jf>hist_${k}.hist
