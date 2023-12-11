for i in `ls ~/project/wubeizi/orthofinder/genome_orthomcl/final16/OrthoFinder/Results_Sep19/Orthogroups/cds/*.2`
do 
echo $i
seqkit sort $i >$i.3
seqkit seq $i.3 -w 0 > $i.3.4
done
