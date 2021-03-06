#!/bin/bash

for file in $(find data -name '*.osm' ! -type l)
do
  # echo " Cleanin $file ..."
  osmfilter $file --drop=action=delete -o=$file.clean > /dev/null 2>&1
  if ! cmp -s $file $file.clean
  then
    mv -v $file.clean $file
  else
    rm $file.clean
  fi
done
