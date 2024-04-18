# A bash script to create multiple indexed slurm scripts and submit them to the cluster, starting from the slurm script clus.sbatch

for i in {1..20}
do

sed -i "s/nclus=/nclus=$i;/" "sr.m"

cp "sr.m" "runs/run$i.m"

sed -i "s/nclus=$i;/nclus=/" "sr.m"

done

for i in {1..20}
do

sed -i "s/nclus=/nclus=$i/" clus.sbatch
sed -i "s/SR.out/SR$i.out/" clus.sbatch

FILE="/output/tablespin$i.txt"
if  test -f $FILE; then
echo "Image $i was already run"
else
echo "Submitting image $i"
#cat clus.sbatch
sbatch clus.sbatch
fi

sed -i "s/nclus=$i/nclus=/" clus.sbatch
sed -i "s/SR$i.out/SR.out/" clus.sbatch

done
