#!/bin/bash
echo "hello"
echo "test var: ${MA_VARIABLE}"
if [[ -z $1 ]];
then 
    echo "No parameter passed."
else
    echo "Parameter passed = $1"
fi