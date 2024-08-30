#!/bin/bash
FIO="Latyshev VA"
date=$(date)
if [ $1 = 1 ]
then
echo "$FIO"
elif [ $1 = 2 ]
then
echo "$date"
else
echo  "No parameters found."
fi

