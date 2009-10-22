#!/bin/bash
path=$1
mkdir -p condor/var/spool condor/var/log condor/var/execute
for file in `cat files`; do
  if test -d $path/$file; then
    mkdir condor/$file
  elif test -e $path/$file; then
    mv $path/$file condor/$file
  else
    echo $file
  fi
done
