for i in `ls ~/project/wubeizi/orthofinder/genome_orthomcl/final16/OrthoFinder/Results_Sep19/Orthogroups/cds/*.fa`
#do
#echo $i
do 
muscle -align $i -output $i.1
done
