#!/bin/bash

######################
### MIRA Assembler ###
######################

# running MIRA 4.0.2
# MIRA requires FASTQ file input (to avoid downloading multiple files from the Torrent server, we'll convert the bam to fastq)
# convert initial bam file to fastq file
for file in seqs/*.bam;
do
name=$(echo $file | cut -f1 -d'.' | cut -f2 -d'/')
./bedtools2/bin/bamToFastq -i $file -fq ~/seqs/fastq/$name.fastq
echo $name "original fastq file created";
done

# Make manifest file for original fastq file
for file in seqs/fastq/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
echo project = $name >> ~/mira_conf_files/$name.conf
echo job = genome,denovo,accurate >> ~/mira_conf_files/$name.conf
echo readgroup >> ~/mira_conf_files/$name.conf
echo data = ~/seqs/fastq/$name.fastq >> ~/mira_conf_files/$name.conf
echo technology = iontor >> ~/mira_conf_files/$name.conf
echo parameters = COMMON_SETTINGS -NW:cac=no >> ~/mira_conf_files/$name.conf
echo $name "original manifest file created";
done

###########################
### Reducing # of reads ###
###########################

##########
### 1% ###
##########

# reducing number of reads, since MIRA recommends somewhat lower coverage than we initially sequenced at
# reduce to 1%
for file in seqs/*.bam;
do
name=$(echo $file | cut -f1 -d'.' | cut -f2 -d'/')
samtools view -s 0.01 -b $file > ~/seqs/reduced_1p/$name"_1p".bam
echo $name "1% reduced bam file created";
done

# convert 1% bam file to fastq file
for file in seqs/reduced_1p/*.bam;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
./bedtools2/bin/bamToFastq -i $file -fq ~/seqs/fastq_1p/$name.fastq
echo $name "1% reduced fastq file created";
done

# Make manifest file for 1% fastq file
for file in seqs/fastq_1p/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
echo project = $name >> ~/mira_conf_files/$name.conf
echo job = genome,denovo,accurate >> ~/mira_conf_files/$name.conf
echo readgroup >> ~/mira_conf_files/$name.conf
echo data = ~/seqs/fastq_1p/$name.fastq >> ~/mira_conf_files/$name.conf
echo technology = iontor >> ~/mira_conf_files/$name.conf
echo parameters = COMMON_SETTINGS -NW:cac=no >> ~/mira_conf_files/$name.conf
echo $name "1% reduced manifest file created";
done

###########
### 10% ###
###########

# reduce to 10%
for file in seqs/*.bam;
do
name=$(echo $file | cut -f1 -d'.' | cut -f2 -d'/')
samtools view -s 0.1 -b $file > ~/seqs/reduced_10p/$name"_10p".bam
echo $name "10% reduced bam file created";
done

# convert 10% file to fastq file
for file in seqs/reduced_10p/*.bam;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
./bedtools2/bin/bamToFastq -i $file -fq ~/seqs/fastq_10p/$name.fastq
echo $name "10% reduced fastq file created";
done

# Make manifest file for 10% fastq file
for file in seqs/fastq_10p/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
echo project = $name >> ~/mira_conf_files/$name.conf
echo job = genome,denovo,accurate >> ~/mira_conf_files/$name.conf
echo readgroup >> ~/mira_conf_files/$name.conf
echo data = ~/seqs/fastq_10p/$name.fastq >> ~/mira_conf_files/$name.conf
echo technology = iontor >> ~/mira_conf_files/$name.conf
echo parameters = COMMON_SETTINGS -NW:cac=no >> ~/mira_conf_files/$name.conf
echo $name "10% reduced manifest file created";
done

###########################
#### Trimming to 252 bp ###
###########################

# MGH recommended trimming reads to 252 bp
# trim the full file to 252 bp
for file in seqs/fastq/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
fastx_trimmer -l 252 -i $file -o ~/seqs/trimmed/$name"_trim".fastq
echo $name "trimmed fastq file created";
done

# Make manifest file for trimmed fastq file
for file in seqs/trimmed/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
echo project = $name >> ~/mira_conf_files/$name.conf
echo job = genome,denovo,accurate >> ~/mira_conf_files/$name.conf
echo readgroup >> ~/mira_conf_files/$name.conf
echo data = ~/seqs/trimmed/$name.fastq >> ~/mira_conf_files/$name.conf
echo technology = iontor >> ~/mira_conf_files/$name.conf
echo parameters = COMMON_SETTINGS -NW:cac=no >> ~/mira_conf_files/$name.conf
echo $name "trimmed manifest file created";
done

##########
### 1% ###
##########

# trim the 1% file to 252 bp
for file in seqs/fastq_1p/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
fastx_trimmer -l 252 -i $file -o ~/seqs/trimmed_1p/$name"_trim".fastq
echo $name "1% reduced & trimmed fastq file created";
done

# Make manifest file for trimmed 1% fastq file
for file in seqs/trimmed_1p/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
echo project = $name >> ~/mira_conf_files/$name.conf
echo job = genome,denovo,accurate >> ~/mira_conf_files/$name.conf
echo readgroup >> ~/mira_conf_files/$name.conf
echo data = ~/seqs/trimmed_1p/$name.fastq >> ~/mira_conf_files/$name.conf
echo technology = iontor >> ~/mira_conf_files/$name.conf
echo parameters = COMMON_SETTINGS -NW:cac=no >> ~/mira_conf_files/$name.conf
echo $name "1% reduced and trimmed manifest file created";
done

###########
### 10% ###
###########
# trim the 10% file to 252 bp
for file in seqs/fastq_10p/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
fastx_trimmer -l 252 -i $file -o ~/seqs/trimmed_10p/$name"_trim".fastq
echo $name "10% reduced and trimmed fastq file created";
done

# Make manifest file for trimmed 10% fastq file
for file in seqs/trimmed_10p/*.fastq;
do
name=$(echo $file | cut -f1 -d'.' | cut -f3 -d'/')
echo project = $name >> ~/mira_conf_files/$name.conf
echo job = genome,denovo,accurate >> ~/mira_conf_files/$name.conf
echo readgroup >> ~/mira_conf_files/$name.conf
echo data = ~/seqs/trimmed_10p/$name.fastq >> ~/mira_conf_files/$name.conf
echo technology = iontor >> ~/mira_conf_files/$name.conf
echo parameters = COMMON_SETTINGS -NW:cac=no >> ~/mira_conf_files/$name.conf
echo $name "10% reduced and trimmed manifest file created";
done

# running the assembler
for file in mira_conf_files/*.conf;
do
name=$(echo $file | cut -f1 -d'.' | cut -f2 -d'/')
mkdir ~/mira_results/$name
cd ~/mira_results/$name
~/mira_4.0.2_linux-gnu_x86_64_static/bin/mira ~/mira_conf_files/$name.conf

# Deleting files
mkdir ~/final_results/mira/$name
cp ~/mira_results/$name/$name"_assembly"/$name"_d_results"/*.fasta ~/final_results/mira/$name/
cp ~/mira_results/$name/$name"_assembly"/$name"_d_results"/*.fasta.qual ~/final_results/mira/$name/
cp ~/mira_results/$name/$name"_assembly"/$name"_d_results"/*.maf ~/final_results/mira/$name/
cp ~/mira_results/$name/$name"_assembly"/$name"_d_info"/$name"_info_assembly.txt" ~/final_results/mira/$name/
rm -r ~/mira_results/$name
rm ~/mira_conf_files/$name.conf;
done

rm ~/seqs/fastq/*
rm ~/seqs/fastq_1p/*
rm ~/seqs/fastq_10p/*
rm ~/seqs/reduced_1p/*
rm ~/seqs/reduced_10p/*
rm ~/seqs/trimmed/*
rm ~/seqs/trimmed_1p/*
rm ~/seqs/trimmed_10p/*
