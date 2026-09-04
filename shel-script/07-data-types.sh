#!/bin/bash

NUM1=10
NUM2=20

SUM=$(($NUM1+$NUM2))

echo "Sum is: $SUM"

# Array
PROGRAMMES=("Java" "Python" "C++")  # index always starts from 0
echo "Programmes are: ${PROGRAMMES[@]}"
