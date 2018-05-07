#!/bin/bash

# Input file must be saved in the SPADes-3.11.1-Linux/bin directory
read -p "Enter file name (must end in .bam)" seqfile
name=$(echo $seqfile | cut -f1 -d'.')
mkdir -p $name

# Running SPAdes3.11 for multiple kmer lengths
./spades.py --iontorrent --sc -s $seqfile -k 21 -o $name/k_21
./spades.py --iontorrent --sc -s $seqfile -k 33 -o $name/k_33
./spades.py --iontorrent --sc -s $seqfile -k 39 -o $name/k_39
./spades.py --iontorrent --sc -s $seqfile -k 41 -o $name/k_41
./spades.py --iontorrent --sc -s $seqfile -k 45 -o $name/k_45
./spades.py --iontorrent --sc -s $seqfile -k 55 -o $name/k_55
./spades.py --iontorrent --sc -s $seqfile -k 77 -o $name/k_77
./spades.py --iontorrent --sc -s $seqfile -k 89 -o $name/k_89
./spades.py --iontorrent --sc -s $seqfile -k 99 -o $name/k_99
./spades.py --iontorrent --sc -s $seqfile -k 105 -o $name/k_105
./spades.py --iontorrent --sc -s $seqfile -k 115 -o $name/k_115
./spades.py --iontorrent --sc -s $seqfile -k 125 -o $name/k_125
./spades.py --iontorrent --sc -s $seqfile -k 127 -o $name/k_127
./spades.py --iontorrent --sc -s $seqfile -k 21,33,39,41,45,55,77,89,99,105,115,125,127 -o $name/k_multi

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

# Print output of longest contigs to screen
head -n 20 ./$name/lengths.txt
