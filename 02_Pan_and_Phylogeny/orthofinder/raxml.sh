java -jar ~/software/prottest-3.4.2/prottest-3.4.2.jar -i /home/blfan/project/wubeizi/orthofinder/genome_orthomcl/pep_final_adjust_cov90_QFY/OrthoFinder/Results_Oct24/Orthogroups/cds/new/all.phy -all-distributions -F -AIC -BIC -tc 0.5 -threads 40 -o prottest.out

raxmlHPC-PTHREADS-SSE3 -T 70 -f a -x 123 -p 123 -N 200 -m PROTGAMMAAUTO -k -O -o O.sativa -n all.tre -s ~/project/wubeizi/orthofinder/genome_orthomcl/final16/OrthoFinder/Results_Sep19/Orthogroups/cds/new/all.phy
