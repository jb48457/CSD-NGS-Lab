#!/bin/bash
#####################
### SPAdes 3.11.1 ###
#####################

for file in seqs/*.bam;
do

# Extracting file name
name=$(echo $file | cut -f1 -d'.' | cut -f2 -d'/')
mkdir -p $name
mkdir -p ~/final_results/$name

###################
### Initial run ###
###################

# Running SPAdes3.11 for multiple kmer lengths to see how total plasmid length varies
# kmer values originally selected by CSD lab staff
# copying contig files to main folder for preservation
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 21 -o $name/k_21
cp ./$name/k_21/contigs.fasta ~/final_results/$name/$name"_k_21_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 33 -o $name/k_33
cp ./$name/k_33/contigs.fasta ~/final_results/$name/$name"_k_33_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 39 -o $name/k_39
cp ./$name/k_39/contigs.fasta ~/final_results/$name/$name"_k_39_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 41 -o $name/k_41
cp ./$name/k_41/contigs.fasta ~/final_results/$name/$name"_k_41_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 45 -o $name/k_45
cp ./$name/k_45/contigs.fasta ~/final_results/$name/$name"_k_45_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 55 -o $name/k_55
cp ./$name/k_55/contigs.fasta ~/final_results/$name/$name"_k_55_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 77 -o $name/k_77
cp ./$name/k_77/contigs.fasta ~/final_results/$name/$name"_k_77_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 89 -o $name/k_89
cp ./$name/k_89/contigs.fasta ~/final_results/$name/$name"_k_89_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 99 -o $name/k_99
cp ./$name/k_99/contigs.fasta ~/final_results/$name/$name"_k_99_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 105 -o $name/k_105
cp ./$name/k_105/contigs.fasta ~/final_results/$name/$name"_k_105_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 115 -o $name/k_115
cp ./$name/k_115/contigs.fasta ~/final_results/$name/$name"_k_115_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 125 -o $name/k_125
cp ./$name/k_125/contigs.fasta ~/final_results/$name/$name"_k_125_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 127 -o $name/k_127
cp ./$name/k_127/contigs.fasta ~/final_results/$name/$name"_k_127_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 21,33,39,41,45,55,77,89,99,105,115,125,127 -o $name/k_multi
cp ./$name/k_multi/contigs.fasta ~/final_results/$name/$name"_k_multi_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 21,33,55 -o $name/k_235
cp ./$name/k_235/contigs.fasta ~/final_results/$name/$name"_k_235_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $file -k 21,33,55,77 -o $name/k_2357
cp ./$name/k_2357/contigs.fasta ~/final_results/$name/$name"_k_2357_contigs".fasta

# Save longest contig length for each kmer value to lengths.txt file
len=$(head -n 1 ./$name/k_21/contigs.fasta | grep "length_[0-9]*" -o)
echo "k21: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_33/contigs.fasta | grep "length_[0-9]*" -o)
echo "k33: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_39/contigs.fasta | grep "length_[0-9]*" -o)
echo "k39: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_41/contigs.fasta | grep "length_[0-9]*" -o)
echo "k41: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_45/contigs.fasta | grep "length_[0-9]*" -o)
echo "k45: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_55/contigs.fasta | grep "length_[0-9]*" -o)
echo "k55: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_77/contigs.fasta | grep "length_[0-9]*" -o)
echo "k77: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_89/contigs.fasta | grep "length_[0-9]*" -o)
echo "k89: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_99/contigs.fasta | grep "length_[0-9]*" -o)
echo "k99: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_105/contigs.fasta | grep "length_[0-9]*" -o)
echo "k105: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_115/contigs.fasta | grep "length_[0-9]*" -o)
echo "k115: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_125/contigs.fasta | grep "length_[0-9]*" -o)
echo "k125: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_127/contigs.fasta | grep "length_[0-9]*" -o)
echo "k127: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_multi/contigs.fasta | grep "length_[0-9]*" -o)
echo "k_multi: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_235/contigs.fasta | grep "length_[0-9]*" -o)
echo "k235: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/k_2357/contigs.fasta | grep "length_[0-9]*" -o)
echo "k2357: $len" >> ./$name/lengths.txt

#################
### --careful ###
#################

# Using the --careful option (careful tries to reduce mismatches and short indels by running MisMatchCorrector, a post-processing
# tool which uses BWA)
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 21 -o $name/c_k_21
cp ./$name/c_k_21/contigs.fasta ~/final_results/$name/$name"_c_k_21_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 33 -o $name/c_k_33
cp ./$name/c_k_33/contigs.fasta ~/final_results/$name/$name"_c_k_33_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 39 -o $name/c_k_39
cp ./$name/c_k_39/contigs.fasta ~/final_results/$name/$name"_c_k_39_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 41 -o $name/c_k_41
cp ./$name/c_k_41/contigs.fasta ~/final_results/$name/$name"_c_k_41_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 45 -o $name/c_k_45
cp ./$name/c_k_45/contigs.fasta ~/final_results/$name/$name"_c_k_45_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 55 -o $name/c_k_55
cp ./$name/c_k_55/contigs.fasta ~/final_results/$name/$name"_c_k_55_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 77 -o $name/c_k_77
cp ./$name/c_k_77/contigs.fasta ~/final_results/$name/$name"_c_k_77_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 89 -o $name/c_k_89
cp ./$name/c_k_89/contigs.fasta ~/final_results/$name/$name"_c_k_89_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 99 -o $name/c_k_99
cp ./$name/c_k_99/contigs.fasta ~/final_results/$name/$name"_c_k_99_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 105 -o $name/c_k_105
cp ./$name/c_k_105/contigs.fasta ~/final_results/$name/$name"_c_k_105_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 115 -o $name/c_k_115
cp ./$name/c_k_115/contigs.fasta ~/final_results/$name/$name"_c_k_115_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 125 -o $name/c_k_125
cp ./$name/c_k_125/contigs.fasta ~/final_results/$name/$name"_c_k_125_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 127 -o $name/c_k_127
cp ./$name/c_k_127/contigs.fasta ~/final_results/$name/$name"_c_k_127_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 21,33,39,41,45,55,77,89,99,105,115,125,127 -o $name/c_k_multi
cp ./$name/c_k_multi/contigs.fasta ~/final_results/$name/$name"_c_k_multi_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 21,33,55 -o $name/c_k_235
cp ./$name/c_k_235/contigs.fasta ~/final_results/$name/$name"_c_k_235_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc --careful -s $file -k 21,33,55,77 -o $name/c_k_2357
cp ./$name/c_k_2357/contigs.fasta ~/final_results/$name/$name"_c_k_2357_contigs".fasta

# Save longest contig length for each kmer value to lengths.txt file
len=$(head -n 1 ./$name/c_k_21/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k21: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_33/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k33: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_39/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k39: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_41/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k41: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_45/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k45: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_55/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k55: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_77/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k77: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_89/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k89: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_99/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k99: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_105/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k105: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_115/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k115: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_125/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k125: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_127/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k127: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_multi/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k_multi: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_235/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k235: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/c_k_2357/contigs.fasta | grep "length_[0-9]*" -o)
echo "c_k2357: $len" >> ./$name/lengths.txt

####################
### plasmidSPAdes ###
####################

# Testing out the plasmidSPAdes option (a pipeline for extracting and assembling plasmids from WGS data sets)
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --plasmid -s $file -k 21,33,55 -o $name/pl_k_235
cp ./$name/pl_k_235/contigs.fasta ~/final_results/$name/$name"_pl_k_235_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --plasmid -s $file -k 21,33,55,77 -o $name/pl_k_2357
cp ./$name/pl_k_2357/contigs.fasta ~/final_results/$name/$name"_pl_k_2357_contigs".fasta

# Save longest contig length for each kmer value to lengths.txt file
len=$(head -n 1 ./$name/pl_k_235/contigs.fasta | grep "length_[0-9]*" -o)
echo "pl_k235: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/pl_k_2357/contigs.fasta | grep "length_[0-9]*" -o)
echo "pl_k2357: $len" >> ./$name/lengths.txt

#################
### 10% reads ###
#################

# Reducing original bam file to 10% of the reads
samtools view -s 0.1 -b $file > $name"_10p".bam

# Running SPAdes3.11 for multiple kmer lengths
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $name"_10p".bam -k 21,33,55 -o $name/10p_k_235
cp ./$name/10p_k_235/contigs.fasta ~/final_results/$name/$name"_k_235_10p_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $name"_10p".bam -k 21,33,55,77 -o $name/10p_k_2357
cp ./$name/10p_k_2357/contigs.fasta ~/final_results/$name/$name"_k_2357_10p_contigs".fasta

# Save longest contig length for each kmer value to lengths.txt file
len=$(head -n 1 ./$name/10p_k_235/contigs.fasta | grep "length_[0-9]*" -o)
echo "10p_k235: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/10p_k_2357/contigs.fasta | grep "length_[0-9]*" -o)
echo "10p_k2357: $len" >> ./$name/lengths.txt;

##############################################################
### Reads trimmed to 252 bp (per MGH's recommendation) ###
##############################################################

# convert bam file to fastq file
./bedtools2/bin/bamToFastq -i $file -fq $name.fastq;

# trim to 252 bp (per MGH's recommendation)
fastx_trimmer -l 252 -i $name.fastq -o $name"_trim".fastq

# Running SPAdes3.11 for multiple kmer lengths
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $name"_trim".fastq -k 21,33,55 -o $name/trim_k_235
cp ./$name/trim_k_235/contigs.fasta ~/final_results/$name/$name"_trim_k_235_contigs".fasta
./SPAdes-3.11.1-Linux/bin/spades.py --iontorrent --sc -s $name"_trim".fastq -k 21,33,55,77 -o $name/trim_k_2357
cp ./$name/trim_k_2357/contigs.fasta ~/final_results/$name/$name"_trim_k_2357_contigs".fasta

# Save longest contig length for each kmer value to lengths.txt file
len=$(head -n 1 ./$name/trim_k_235/contigs.fasta | grep "length_[0-9]*" -o)
echo "trim_k_235: $len" >> ./$name/lengths.txt
len=$(head -n 1 ./$name/trim_k_2357/contigs.fasta | grep "length_[0-9]*" -o)
echo "trim_k_2357: $len" >> ./$name/lengths.txt

# server space is at a premium, so the lengths file and all of the contig files have been copied to a separate directory
# the main directory with the additional files will be deleted
cp ./$name/lengths.txt ~/final_results/SPAdes/$name/$name.txt
rm $name -r;
done
