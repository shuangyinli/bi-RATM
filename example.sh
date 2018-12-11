#!/bin/bash

#This is simple example how to use bi_ratm for training and testing.

#The train set is a very small part of training set with 3,000 documents, and 600 documents are for testing.
#
#Check ../input/ to show the input files: training set, test set, etc.
#Check ./output to show the output.

make clean
echo
make
echo
rm -f ./output/*

echo

time ./bi_ratm est setting.txt ./input/train.txt ./output/ ./input/final.beta

echo