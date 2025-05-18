#!/bin/bash

N=$1

#-gt is greater than
#-lt is less than
#-ne is not equal
#-eq is equal

if [ $N -gt 100 ]
then
    echo "$N is greater than 100"
else 
    echo "$N is not greater than 100"
fi