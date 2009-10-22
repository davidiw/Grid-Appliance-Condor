#!/bin/bash
path=$1
for file in `cat files`; do
  if ! test -d $path/$file && ! test -e $path/$file; then 
    echo $file
  fi
done
