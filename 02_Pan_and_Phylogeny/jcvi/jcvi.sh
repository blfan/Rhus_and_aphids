python -m jcvi.formats.gff bed --type=gene --key=Name /home/llchen/data/Rhus_chinensis_Mill/Annotation/HFY_B1.genome.version2/YFM_B1_HFY.gff.version3/all/YFM.gff3 -o YFM.bed
python -m jcvi.formats.gff bed --type=gene --key=Name /home/llchen/data/Rhus_chinensis_Mill/Annotation/HFY_B1.genome.version2/YFM_B1_HFY.gff.version3/all/B1.gff3 -o B1.bed
python -m jcvi.formats.gff bed --type=gene --key=Name /home/llchen/data/Rhus_chinensis_Mill/Annotation/HFY_B1.genome.version2/YFM_B1_HFY.gff.version3/all/HFY.gff3 -o HFY.bed

python -m jcvi.formats.fasta format /home/llchen/data/Rhus_chinensis_Mill/Annotation/HFY_B1.genome.version2/YFM_B1_HFY.gff.version3/all/YFM_cds.fa YFM.cds
python -m jcvi.formats.fasta format /home/llchen/data/Rhus_chinensis_Mill/Annotation/HFY_B1.genome.version2/YFM_B1_HFY.gff.version3/all/B1_cds.fa B1.cds
python -m jcvi.formats.fasta format /home/llchen/data/Rhus_chinensis_Mill/Annotation/HFY_B1.genome.version2/YFM_B1_HFY.gff.version3/all/HFY_cds.fa HFY.cds

python -m jcvi.compara.catalog ortholog YFM B1 --no_strip_names
python -m jcvi.compara.catalog ortholog YFM HFY --no_strip_names
python -m jcvi.compara.catalog ortholog B1 HFY --no_strip_names

python -m jcvi.graphics.dotplot YFM.B1.anchors
python -m jcvi.compara.catalog ortholog YFM B1 --cscore=.99 --no_strip_names
python -m jcvi.compara.synteny depth --histogram YFM.B1.anchors
python -m jcvi.compara.synteny screen --minspan=30 --simple YFM.B1.anchors YFM.B1.anchors.new 
python -m jcvi.graphics.karyotype seqids layout

python -m jcvi.compara.catalog ortholog YFM HFY --cscore=.99 --no_strip_names
python -m jcvi.compara.synteny screen --minspan=30 --simple YFM.HFY.anchors YFM.HFY.anchors.new

python -m jcvi.compara.catalog ortholog B1 HFY --cscore=.99 --no_strip_names
python -m jcvi.compara.synteny screen --minspan=30 --simple B1.HFY.anchors B1.HFY.anchors.new

python simple2links.py YFM.B1.anchors.simple
python simple2links.py YFM.HFY.anchors.simple
python simple2links.py B1.HFY.anchors.simple
