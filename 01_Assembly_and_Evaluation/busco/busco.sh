genome=HJS.ragtag.scaffold.fasta
name=HJS

busco -i ../${genome} -o ${name} -m geno -l ./eudicots_odb10 --cpu 60 --offline
#busco -i ../${genome} -o ${name} -m geno -l ./insecta_odb10 --cpu 60 --offline
