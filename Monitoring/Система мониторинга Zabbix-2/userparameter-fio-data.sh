#!/bin/bash
FIO="Latyshev VA"
date=$(date)
if [ -n $1 ]
then
echo  "No parameters found."
elif [ $1 = 1 ]
then
echo "$FIO"
elif [ $1 = 2 ]
then
echo "$date"
else
echo  "No parameters found."
fi

