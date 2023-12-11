for i in `ls ~/project/wubeizi/orthofinder/genome_orthomcl/final16/OrthoFinder/Results_Sep19/Orthogroups/cds/*.1`
do
echo $i 
Gblocks $i -b4=5 -b5=h -t=c -e=.2
done
