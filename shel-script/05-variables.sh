#!/bin/bash

# TIMESTAMP=$(date +%s)

# echo "Time is: $TIMESTAMP "

START_TIME=$(date +%s)
 sleep 10

 END_TIME=$(date +%s)

 TOTAL_TIME=$(($END_TIME-$START_TIME))
 echo "Total time executed: $TOTAL_TIME seconds"