#!/bin/bash

awk '{print $1,$2,$5,$6}' $1 | grep $2 | grep $3

#$1 is the day in question
#$2 is the name of the person in question
#$3 is AM or PM
