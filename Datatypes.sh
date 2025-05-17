#!/bin/bash

N1=100
N2=200

Timestamp=$(Date)

echo "Script executed at : $Timestamp"

SUM=(($N1+$N2))

echo "Sum of $N1 and $N2 is: $SUM"

MULTIPLY=(($N1*$N2))

echo "Multiply of $N1 and $N2 is: $MULTIPLY"