for i in `cat /home/blfan/project/wubeizi/orthofinder/genome_orthomcl/Sapindales/OrthoFinder/Results_Sep28/Orthogroups/list`
do 
echo $i
gerpcol -t /home/blfan/project/wubeizi/orthofinder/genome_orthomcl/Sapindales/gerp/FigTree.tre -a -f $i.afa -e M.azedarach -j -z
done